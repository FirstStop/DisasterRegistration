class WizardController < ApplicationController
  def index
    @model = ServiceProvider.find_by_special_role(:registration)
  end
end
