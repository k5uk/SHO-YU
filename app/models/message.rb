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
        @messages = Message.where(@sql1.or @sql2)
        @messages
    end
    
    # 新着メッセージの取得処理（フレンド指定）
    def self.getNewArraivalMessages(user_id,friend_id)
        @partner_Messages = Message.where(speaker_id: friend_id, listener_id: user_id, read_flag: 0)
        #updateReadFlag(friend_id, user_id)
        @partner_Messages
    end
    
    # 既読フラグの更新
    def self.updateReadFlag(friend_id,user_id)
        Message.where(speaker_id: friend_id, listener_id: user_id).update_all(read_flag: 1)
    end
    
    # 新着メッセージの取得処理（全部）
    def self.getNewArraivalMessagesAll(user_id)
        @newArraivalMessagesAll = Message.where(listener_id: user_id, read_flag: 0)
        @newArraivalMessagesAll
    end
    
end
