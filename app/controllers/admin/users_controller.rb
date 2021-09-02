class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  skip_before_action :login_required
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :destroy_myself, only: [:destroy]


  def index
    if current_user.admin?
      @users = User.all.includes(:tasks).order(created_at: 'ASC')
    else
      redirect_to root_path,
                  notice: "管理者権限がありません"
    end

    
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id unless current_user
      redirect_to admin_users_path(@user),
                  notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path(@user),
                  notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path,
                notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def destroy_myself
    if @user == current_user
      redirect_to admin_users_url,
                  notice: "自分自身を削除することは出来ません。"
    end
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end


end
