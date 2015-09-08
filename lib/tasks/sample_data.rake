namespace :db do
  desc "Fill database with sample data FOLLOW!"
  task populate: :environment do

    mainUserId = User.select(:id).first
    users = User.pluck(:id)
    users.delete_at(0)
    executeLoop(mainUserId)
    
    #main user follow all users and
    #main user followed all users
    
    def executeLoop(mainUserId)
        
        for id in users do
        
            Relationship.create(:follower_id => mainUserId, :followed_id => id)
            Relationship.create(:follower_id => id, :followed_id => mainUserId)
        
        end
        
    end
    
  end
  
end