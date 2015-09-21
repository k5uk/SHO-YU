class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    area = params[:user]["area"]
    kiryoku = params[:user]["kiryoku"]
    age = params[:user]["age"]
    
    #@users = User.where("area = :area and kiryoku = :kiryoku", area: area, kiryoku: kiryoku)

    @users = User.searchUser(area,kiryoku,age)
    @users = @users.paginate(:page => params[:page], :per_page => 8)
  end
  
  def search
    @user = User.new
  end
  
  def following
    @title = "友達登録しているユーザ"
    @user = User.find(params[:id])
    @users = @user.followed_users
    @users = @users.paginate(:page => params[:page], :per_page => 8)
    render 'show_follow'
  end
  
  def followers
    @title = "友達登録されているユーザ"
    @user = User.find(params[:id])
    @users = @user.followers
    @users = @users.paginate(:page => params[:page], :per_page => 8)
    render 'show_follow'
  end
  
  private
  
    def user_params
      params.require(:user).permit(:content, :image)
    end
  
end
