class SessionController < ApplicationController
  before_action :set_menu
  def set_menu
    @menu = {login: true}
  end

  def login
  end

  def do_login
    if(user = Authenticable.authenticate(params[:username], params[:password]))
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to session_login_path, notice: 'Password or username incorrect!'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out'
  end
end
