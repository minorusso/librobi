class UsersController < ApplicationController
  before_action :ensure_normal_user, only: %i[ update destroy]

  def index
    @users = User.page(params[:page]).per(20).reverse_order
    @users = @users.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @following_users = @user.following_user
    @follower_users = @user.follower_user

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end
  
  def ensure_normal_user
    @user = User.find(params[:id])
    if @user.name == 'ゲスト'|| @user.name == '管理者ゲスト'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません'
    end
  end
end
