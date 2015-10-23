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
        @users = current_user.followed_users.paginate(:page => params[:friendList_page], :per_page => 8)
        # mapping friend message count each friend id
        if @users.present? and @allNewMsg.present?
            @messageCountMap = Hash.new
            @users.each do |friend|
                counter = @newArraivalMessagesAll.where(speaker_id: friend.id).count
                @messageCountMap.store(friend.id,counter)
            end
        end

        if params[:friend_id].present?  # friend select case
            @oldMsgs = Message.getOldMessage(current_user,params[:friend_id])
            @newArrvlMsg = Message.getNewArrvlMsg(current_user.id,params[:friend_id])
            @partner_inf = User.getPartnerInf(params[:friend_id])
            @friend_flag = User.checkFriend(@users, params[:friend_id])
            # pusher config load
            config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
            @pusher_access_key = config_pusher['access_key']
        else    # friend not select case
            @allNewMsg = Message.getNewMsgAll(current_user.id).paginate(:page => params[:newArraival_page], :per_page => 5)
            @allNewMsgCnt = @allNewMsg.count
            #[0]messages [1]message count
            notificationMsgArray = Message.getNotificateMsgs(current_user.id)
            @notificationMsgs = notificationMsgArray[0].paginate(:page => params[:notificate_page], :per_page => 5)
            @notificationMsgCnt = notificationMsgArray[1]
        end
    end
end