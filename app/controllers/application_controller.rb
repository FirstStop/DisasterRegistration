class ApplicationController < ActionController::Base
  before_action :set_menu
  def set_menu
    @menu = {}
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= Authenticable.find(session[:user_id]) if session[:user_id]
  end

  def check_login
    if requires_login && current_user == nil
      redirect_to session_login_path
    end
  end

  helper_method :current_user
end
