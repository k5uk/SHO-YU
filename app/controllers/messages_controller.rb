class MessagesController < ApplicationController
    def post
        if params[:startMessage] 
        
        else
            Pusher['general_channel'].trigger('chat_event',{message: params[:message],speaker: params[:speaker_id]})
            render :text => 'OK', :status => 200
            Message.saveMessage(params)
        end
    end
    
    def index
        config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
        @pusher_access_key = config_pusher['access_key']
        
        @user = current_user
        @users = @user.followed_users
        @users = @users.paginate(:page => params[:page], :per_page => 8)

        if ! params[:friend_id].nil?
            @messages = Message.getOldMessage(current_user,params[:friend_id])
            @newArraivalMessages = Message.getNewArraivalMessages(current_user,params[:friend_id])
            @friend_id = params[:friend_id]
            @partner_inf = User.getPartnerInformation(@friend_id)
            @friend_flag = User.checkFriend(@users, @friend_id)
            puts "ちぇっく"
            puts @friend_flag
        end
        
        @newArraivalMessagesAll = Message.getNewArraivalMessagesAll(current_user.id)
        @newArraivalMessagesCount = @newArraivalMessagesAll.count
        @newArraivalMessagesAll = @newArraivalMessagesAll.paginate(:page => params[:page], :per_page => 5)
        
        if @users.present? and @newArraivalMessagesAll.present?
            @messageCountMap = Hash.new
            @users.each do |user|
                counter = @newArraivalMessagesAll.where(speaker_id: user.id).count
                @messageCountMap.store(user.id,counter)
                puts @messageCountMap[user.id]
            end
        end
    end
    
end