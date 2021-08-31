class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if session[:user_id] = user.id || user.name == '管理者'
        flash.now[:notice] = 'ログインしました'
        redirect_to admin_users_path 
      else 
        flash.now[:notice] = 'ログインしました'
        redirect_to user_path(user.id)
      end
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
  
end

