class Message < ActiveRecord::Base
    
    def self.saveMessage(param)
        speaker_id    = param[:speaker_id]
        speaker_name  = param[:speaker_name]
        listener_id   = param[:listener_id]
        listener_name = param[:listener_name]
        message       = param[:message]
        Message.create(speaker_id: speaker_id, listener_id: listener_id, speaker_name: speaker_name,
                       listener_name: listener_name, message: message, read_flag: 0)
    end
    
    def self.getOldMessage(user_id,friend_id)
        userMsgSql = Message.where(speaker_id: user_id, listener_id: friend_id, read_flag: 1).where_values.reduce(:and)
        friendMsgSql = Message.where(speaker_id: friend_id, listener_id: user_id, read_flag: 1).where_values.reduce(:and)
        oldMsgs = Message.where(userMsgSql.or friendMsgSql).order("created_at")
        oldMsgs
    end
    
    # get new message for specific friend
    def self.getNewArrvlMsg(user_id,friend_id)
        sql = "SELECT messages.* FROM messages WHERE messages.speaker_id = " + friend_id.to_s + " AND messages.listener_id = " + user_id.to_s + " AND read_flag = 0"
        newMsgs = Message.find_by_sql(sql)
        newMsgs
    end

    def self.updateReadFlag(id)
        Message.where(id: id).update_all(read_flag: 1)
    end
    
    def self.getNewMsgAll(user_id)
        allNewMsg = Message.where(listener_id: user_id, read_flag: 0).where.not(speaker_id: 9999999999) # 9999999999 is management id
        allNewMsg
    end
    
    # 9999999999 is management id
    def self.getNotificateMsgs(user_id)
        notificateMsgs = Array.new
        notificateMsgs[0] = Message.where(speaker_id: 9999999999, listener_id: user_id).order("created_at")
        notificateMsgs[1] = notificationMessages[0].where(read_flag: 0).count
        notificateMsgs
    end
    
    # notification when add friends
    def self.notificationAddFriend(user_id, user_name, friend_id)
        friend_name = User.getPartnerInf(friend_id).name
        subject = "友達登録通知"
        message = user_name + "さんが" + friend_name + " さんを友達に登録しました。"
        Message.create(speaker_id: 9999999999,  listener_id: friend_id, speaker_name: "SHO-YU",
        listener_name: friend_name, message: message, subject: subject, read_flag: 0)
    end
    
end
