namespace :db do
  desc "Fill database with sample data FOLLOW!"
  task populate: :environment do

    mainUserId = User.select(:id).first
    users = User.pluck(:id)
    users.delete_at(0)
    
    for num in users do 
        Relationship.create(:follower_id => mainUserId["id"], :followed_id => num)
        Relationship.create(:follower_id => num, :followed_id => mainUserId["id"])
    end
　
  end
  
end
