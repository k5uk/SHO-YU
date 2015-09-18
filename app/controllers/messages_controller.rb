class MessagesController < ApplicationController
    def post
        if params[:startMessage] 
        
        else
            Pusher['general_channel'].trigger('chat_event',{message: params[:message],speaker: params[:current_user_id]})
            render :text => 'OK', :status => 200
            Message.saveMessage(params)
        end
    end
    
    def index
        if ! params[:friend_id].nil?
            @messages = Message.getOldMessage(current_user,params[:friend_id])
            @friend_name = params[:friend_name]
            @friend_id = params[:friend_id]
            @friend_img = params[:friend_img]
        end
        
        config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
        @pusher_access_key = config_pusher['access_key']
        @user = current_user
        @users = @user.followed_users
        
        #@users = @users.paginate(:page => params[:page], :per_page => 8)
        
        if @friend_name.nil?  
            @friend_name = "フレンドの名前"
        end
        
    end
    
end