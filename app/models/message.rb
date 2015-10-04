class Message < ActiveRecord::Base
    
    def self.saveMessage(param)
        @uid1 = param[:current_user_id]
        @uid2 = param[:partner_user_id]
        @partner_name = param[:partner_user_name]
        @message = param[:message]
        Message.create(uid1: @uid1, uid2: @uid2, partner_name: @partner_name, message: @message, read_flag: 0)
    end
    
    def self.getOldMessage(user_id,friend_id)
        @user_Messages = Message.where(uid1: user_id, uid2: friend_id, read_flag: 1)
        @partner_Messages = Message.where(uid1: friend_id, uid2: user_id, read_flag: 1)
        @sql1 = @user_Messages.where_values.reduce(:and)
        @sql2 = @partner_Messages.where_values.reduce(:and)
        @messages = Message.where(@sql1.or @sql2)
        @messages
    end
    
    # 新着メッセージの取得処理（フレンド指定）
    def self.getNewArraivalMessages(user_id,friend_id)
        @partner_Messages = Message.where(uid1: friend_id, uid2: user_id, read_flag: 0)
        #updateReadFlag(friend_id, user_id)
        @partner_Messages
    end
    
    # 既読フラグの更新
    def self.updateReadFlag(friend_id,user_id)
        Message.where(uid1: friend_id, uid2: user_id).update_all(read_flag: 1)
    end
    
    # 新着メッセージの取得処理（全部）
    def self.getNewArraivalMessagesAll(user_id)
        @newArraivalMessagesAll = Message.where(uid2: user_id, read_flag: 0)
        @newArraivalMessagesAll
    end
    
end
