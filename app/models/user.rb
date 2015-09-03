class User < ActiveRecord::Base
  
  #association
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :follower_users, through: :reverse_relationships, source: :follower
  
  #peperclip
  has_attached_file :image, styles: { medium: "150x150>", thumb: "50x50>" }
  
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
  # setting name value
  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
         def self.find_for_oauth(auth)
           user = User.where(uid: auth.uid, provider: auth.provider).first
           
           unless user
              user = User.create(
                 uid: auth.uid,
                 provider: auth.provider,
                 name: auth.info.name,
                 email: auth.info.email,
                 password: Devise.friendly_token[4, 30]
                 )
           end
           
           user
           
         end
         
  #utility
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
end
