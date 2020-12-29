class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    # find_or_create_from_auth_hash! will be implemented in user class.
    user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    # reset_session will remove all sessions corresponding current user.
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
