class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def following
    @title = "友達登録しているユーザ"
    @user = User.find(params[:id])
    @users = @user.followed_users.find(:all)
    render 'show_follow'
  end
  
  def followers
    @title = "友達登録されているユーザ"
    @user = User.find(params[:id])
    @users = @user.followers.find(:all)
    render 'show_follow'
  end
  
  private
  
    def user_params
      params.require(:user).permit(:content, :image)
    end
  
end
