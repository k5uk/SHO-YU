class Contact < ActiveRecord::Base
      
      validates :name, presence: true, length:  { maximum: 30 }
      validates :age, presence: true
      validates :mail, presence: true
      validates :content, presence: true, length:  { maximum: 500 }
      
end
