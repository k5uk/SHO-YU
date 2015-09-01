class User < ActiveRecord::Base
  
  #peperclip
  has_attached_file :image, styles: { medium: "150x150>", thumb: "50x50>" }
  
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
  # setting name value
  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
