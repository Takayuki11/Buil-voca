class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :edit, :destroy, :followings, :followers]
  before_action :correct_user, only:[:edit]
  before_action :correct_user_destroy, only:[:destroy]
  
  
  def index
    @users = User.where(teacher: false).order(id: :desc).page(params[:page]).per(30)
  end

  def show
    @word = Word.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(edit_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to likes_user_path(@user)
    else
      flash.now[:danger] = "プロフィールを更新できませんでした。"
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_url
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(30)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(30)
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @favorites = @user.favorite_words.page(params[:page]).per(30)
    counts(@user)
    
  end
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  private
  
  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      redirect_to root_url
    end
  end
  
  def correct_user_destroy
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash[:danger] = "自分のページで退会してください。"
      redirect_to likes_user_path(current_user)
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def edit_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :eikenlevel, :toeiclevel, :goal, :image)
  end
end
