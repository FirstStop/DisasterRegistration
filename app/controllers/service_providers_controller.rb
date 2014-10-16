class ServiceProvidersController < ApplicationController
  before_action :set_service_provider, only: [:show, :edit, :update, :destroy, :add_person]
  before_action :set_menu
  def set_menu
    @menu = {service_providers: true}
  end

  # GET /service_providers
  # GET /service_providers.json
  def index
    @service_providers = ServiceProvider.all
  end

  # GET /service_providers/1
  # GET /service_providers/1.json
  def show
  end

  # GET /service_providers/1/add_person
  def add_person
    uuid = params[:uuid]
    @person = Person.find_by_uuid(uuid)
    @service_provider.person.push(@person)
    @service_provider.save
    redirect_to @person, notice: @person.first_name + ' ' + @person.last_name + ' was added to your client list.'
  end

  # GET /service_providers/new
  def new
    @service_provider = ServiceProvider.new
  end

  # GET /service_providers/1/edit
  def edit
  end

  # POST /service_providers
  # POST /service_providers.json
  def create
    @service_provider = ServiceProvider.new(service_provider_params)
    respond_to do |format|
      if @service_provider.save
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully created.' }
        format.json { render :show, status: :created, location: @service_provider }
      else
        format.html { render :new }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_providers/1
  # PATCH/PUT /service_providers/1.json
  def update
    respond_to do |format|
      if @service_provider.update_attributes(service_provider_params)
        format.html { redirect_to @service_provider, notice: 'Service provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_provider }
      else
        format.html { render :edit }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_providers/1
  # DELETE /service_providers/1.json
  def destroy
    @service_provider.destroy
    respond_to do |format|
      format.html { redirect_to service_providers_url, notice: 'Service provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_provider
      @service_provider = ServiceProvider.find(params[:id])
      puts "From mongo #{@service_provider.to_mongo}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_provider_params
      params.require(:service_provider).permit(:name, :services_supplies, :authenticable => [:id, :username, :password, :password_confirmation])
    end
end
