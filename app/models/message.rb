class Message < ActiveRecord::Base
    
    def self.saveMessage(param)
        @speaker_id = param[:speaker_id]
        @listener_id = param[:listener_id]
        @speaker_name = param[:speaker_name]
        @listener_name = param[:listener_name]
        @message = param[:message]
        Message.create(speaker_id: @speaker_id, listener_id: @listener_id, speaker_name: @speaker_name,
        listener_name: @listener_name, message: @message, read_flag: 0)
    end
    
    def self.getOldMessage(user_id,friend_id)
        @user_Messages = Message.where(speaker_id: user_id, listener_id: friend_id, read_flag: 1)
        @partner_Messages = Message.where(speaker_id: friend_id, listener_id: user_id, read_flag: 1)
        @sql1 = @user_Messages.where_values.reduce(:and)
        @sql2 = @partner_Messages.where_values.reduce(:and)
        @messages = Message.where(@sql1.or @sql2).order("created_at")
        @messages
    end

    # 新着メッセージの取得処理（フレンド指定）
    def self.getNewArraivalMessages(user_id,friend_id)
        @partner_Messages = Message.where(speaker_id: friend_id, listener_id: user_id, read_flag: 0).order("created_at")
        #updateReadFlag(friend_id, user_id)
        @partner_Messages
    end
    
    # 既読フラグの更新
    def self.updateReadFlag(friend_id,user_id)
        Message.where(speaker_id: friend_id, listener_id: user_id).update_all(read_flag: 1)
    end
    
    # 新着メッセージの取得処理（全部）
    def self.getNewArraivalMessagesAll(user_id)
        @newArraivalMessagesAll = Message.where(listener_id: user_id, read_flag: 0).where.not(speaker_id: 9999999999)
        @newArraivalMessagesAll
    end
    
    # 運営からの通知メッセージの取得 [0]メッセージ [1]未読メッセージの件数
    def self.getNotificationMessage(user_id)
        @NotificationMessages = Array.new
        @NotificationMessages[0] = Message.where(speaker_id: 9999999999, listener_id: user_id).order("created_at")
        @NotificationMessages[1] = @NotificationMessages[0].where(read_flag: 0).count
        @NotificationMessages
    end
    
    # 新規友達登録の通知メール
    def self.notificationAddFriend(user_id, user_name, friend_id)
        # 友達登録被追加側
        friend_name = User.getPartnerInformation(friend_id).name
        subject = "友達登録通知"
        message = user_name + "さんが" + friend_name + " さんを友達に登録しました。"
        Message.create(speaker_id: 9999999999,  listener_id: friend_id, speaker_name: "SHO-YU",
        listener_name: friend_name, message: message, subject: subject, read_flag: 0)
    end
    
end
