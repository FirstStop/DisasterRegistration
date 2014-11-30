
class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update]

  def show
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
    end
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.json { render :show, status: :created, location: @person }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @person = Person.find_by_uuid(params[:id])
    @service_provider = ServiceProvider.find_by_uuid(params[:uuid])
    @wizard = @service_provider.wizard
  end

  def update
    uuid = params[:uuid]
    @person = Person.find_by_uuid(uuid)
    @service_provider.person.push(@person)
    @service_provider.save
    redirect_to @service_provider, notice: @person.first_name + ' ' + @person.last_name + ' was added to your client list.'
    respond_to do |format|
      if @person.update_attributes(person_params)
        format.json { render :show, status: :ok, location: @person }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @wizard = ServiceProvider.find_by_special_role(:registration).wizard
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).except!(:uuid, :created_at, :updated_at).permit!
    end
end
