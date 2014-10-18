class WelcomeController < ApplicationController
  before_action :set_menu
  def set_menu
    @menu = {welcome: true}
  end

  def index
    render layout: 'without_menu'
  end

  def checklist
  end
end
