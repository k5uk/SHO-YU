class RelationshipsController < ApplicationController
    
    def create
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
        Message.notificationAddFriend(current_user.id, current_user.name, @user.id)
        redirect_to @user
    end
    
    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
        redirect_to @user
    end

end