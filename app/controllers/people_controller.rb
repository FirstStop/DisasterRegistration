
class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy, :qr, :token, :print_token]
  before_action :set_menu
  def set_menu
    @menu = {people: true}
  end

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    log_access "view people: #{@people.map(&:uuid)}"
  end

  # GET /people/1
  # GET /people/1.json
  # GET /people/1.png
  # GET /people/1.vcf
  # GET /people/1.pdf
  Mime::Type.register "application/pdf", :pdf
  def show
    log_access "view person details: #{@person.uuid}"

    respond_to do |format|
      format.png do
          qr_code = Services::Token.qr_code(@person, 8).to_img.resize(400, 400)
          send_data qr_code, :type => 'image/png', :disposition => 'inline'
      end
      format.vcf {
        @person.create_activity :vcard_accessed
        render plain: @person.v_card.to_s
        response.content_type = "text/x-vcard"
        response.headers['Content-Length'] = @person.v_card.size.to_s
      }
      format.pdf {
          pdf = Services::Token.generate_token_pdf(@person, settings.token_media)
          send_data pdf.render, filename: "token-#{@person.id}.pdf", type: 'application/pdf'
      }
      format.json { render :json => @person }
      format.html { render :show }
    end

  end
  # GET /people/1/qr
  def qr
      log_access "view person print out: #{@person.uuid}"
  end
  
  # GET /people/1/token
  def qr
      log_access "view person print out: #{@person.uuid}"
  end

  # GET /people/1/print_token
  def print_token
      respond_to do |format|
          format.html {
             pdf = Services::Token.generate_token_pdf(@person, 'DC04')
             file = Tempfile.new('')
             file.puts(pdf.render.force_encoding('UTF-8'))
             file.close

             Services::Printers.print_token(file, "DC04")
             redirect_to people_url, notice: 'Person was successfully printed.'}
      end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update_attributes(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def log_access(action)
      username = current_user ? current_user.username : 'ANONYMOUS'
        logger.info "User: <#{username}>; Action: <#{action}>"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params

      params.require(:person).permit(
          :first_name, :last_name, :dob, :sex, :has_privacy_concerns, :mobile, :email,
          :address, :suburb, :state, :postcode,
          :current_contact_name, :current_contact_phone, :current_contact_email, :current_contact_description,
          :injury_description, :transport, :house_status, :others_at_address, :pet_details, :current_situation,
          :avatar, :fun_fact, :super_power, :speciality, :nickname,
          :authenticable => [:id, :username, :password, :password_confirmation]
      )
    end
end
