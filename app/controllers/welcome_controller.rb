class WelcomeController < ApplicationController
  before_action :set_menu
  def set_menu
    @menu = {welcome: true}
  end

  def index
  end
end
