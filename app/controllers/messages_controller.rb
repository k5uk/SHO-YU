class MessagesController < ApplicationController
    protect_from_forgery :except => [:read_session]
    
    def post
        if params[:ajax_handler] == "pusher"
            Pusher['general_channel'].trigger('chat_event',{message: params[:message],speaker: params[:speaker_id]})
            render :text => 'OK', :status => 200
            Message.saveMessage(params)
        end
    end
    
    def read_session
            messageId = params[:_json]
            puts params[:messageId]
            Message.updateReadFlag(messageId)       
    end
    
    def index
        config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
        @pusher_access_key = config_pusher['access_key']
        
        @user = current_user
        @users = @user.followed_users
        @users = @users.paginate(:page => params[:friendList_page], :per_page => 8)

        if ! params[:friend_id].nil?
            @messages = Message.getOldMessage(current_user,params[:friend_id])
            @newArraivalMessages = Message.getNewArraivalMessages(current_user.id,params[:friend_id])
            @friend_id = params[:friend_id]
            @partner_inf = User.getPartnerInformation(@friend_id)
            @friend_flag = User.checkFriend(@users, @friend_id)
        end
        
        @newArraivalMessagesAll = Message.getNewArraivalMessagesAll(current_user.id)
        @newArraivalMessagesCount = @newArraivalMessagesAll.count
        @newArraivalMessagesAll = @newArraivalMessagesAll.paginate(:page => params[:newArraival_page], :per_page => 5)
        
        if @users.present? and @newArraivalMessagesAll.present?
            @messageCountMap = Hash.new
            @users.each do |user|
                counter = @newArraivalMessagesAll.where(speaker_id: user.id).count
                @messageCountMap.store(user.id,counter)
            end
        end
        
        @notificationMessage = Message.getNotificationMessage(current_user.id)
        @notificationMessage[0] = @notificationMessage[0].paginate(:page => params[:notificate_page], :per_page => 5)

    end
    
end