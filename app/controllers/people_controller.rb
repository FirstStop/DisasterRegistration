require 'rqrcode_png'

class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :qr]
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
  def show
    log_access "view person details: #{@person.uuid}"

    respond_to do |format|
      format.png do
        qr_code = qr_code(@person)
        send_data qr_code, :type => 'image/png', :disposition => 'inline'
      end
      format.vcf {
        @person.create_activity :vcard_accessed
        render plain: @person.v_card.to_s
        response.content_type = "text/x-vcard"
        response.headers['Content-Length'] = @person.v_card.size.to_s
      }
      format.json { render :json => @person }
      format.html { render :show }
    end

  end

  # GET /people/1/qr
  def qr
    log_access "view person print out: #{@person.uuid}"
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
    def qr_code(person, size = 8)
      data = settings.qr_code_generator.content(person)
      begin
        img = RQRCode::QRCode.new( data, :size => size, :level => :l).to_img.resize(400, 400)
        logger.info "created qr code, user=#{person.id}, size=#{size}, content=#{data}"

        return img
      rescue
        size += 1
        retry unless size > 40
      end
    end

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
          :authenticable => [:id, :username, :password, :password_confirmation]
      )
    end
end
