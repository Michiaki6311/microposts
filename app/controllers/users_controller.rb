class UsersController < ApplicationController
  before_action :set_current_user,only: [:edit, :update]
  before_action :set_user, only: [:followings, :followers, :show]
  def show
    @microposts = @user.microposts.order(created_at: :desc)
    
    # @micropost = @user.microposts.build(mi_prams)
    # mi_params[:user_id] = @user.id
    # @micropost = Micropost.build(mi_params)
    
    # @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      @users = User.all
      flash.now[:alert] = 'プロフィールの更新に失敗しました'
      render 'edit'
    end
  end
  
  def followings
    @users = @user.following_users
  end
  
  def followers
    @users = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:age,:area)
  end
  
  def set_current_user
    # @user = User.find(current_user)
    @user = current_user
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
