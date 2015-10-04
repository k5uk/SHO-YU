class Message < ActiveRecord::Base
    
    def self.saveMessage(param)
        @uid1 = param[:current_user_id]
        @uid2 = param[:partner_user_id]
        @message = param[:message]
        Message.create(uid1: @uid1, uid2: @uid2, message: @message)
    end
    
    def self.getOldMessage(user_id,friend_id)
        @user_Messages = Message.where(uid1: user_id, uid2: friend_id)
        @partner_Messages = Message.where(uid1: friend_id, uid2: user_id)
        @sql1 = @user_Messages.where_values.reduce(:and)
        @sql2 = @partner_Messages.where_values.reduce(:and)
        @messages = Message.where(@sql1.or @sql2)
        @messages
    end
    
end
