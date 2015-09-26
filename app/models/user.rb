class User < ActiveRecord::Base
  
  #association
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  #peperclip
  has_attached_file :image, styles: { medium: "250x250>", thumb: "50x50>" }
  
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
  # setting name value
  validates :name, presence: true, length:  { maximum: 30 }
  validates :name, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
         
  def self.find_for_oauth(auth)

    user = User.where(uid: auth.uid, provider: auth.provider).first
    
    unless user
    
    p "authチェック"
    p auth
    p auth.info
    p auth.info.user_birthday
    
       user = User.new(
          #facebook available items
          uid: auth.uid,
          provider: auth.provider,
          name: auth.info.name,
          email: auth.info.email,
          #image: auth.info.image,
          birthday: auth.extra.raw_info.birthday,
          
          #email: User.create_unique_email,
          password: Devise.friendly_token[10, 15],
          confirmed_at: Time.now
          )
      
      user.save
    
    end
    
    user
    
  end
  
  ### パスワード不要で編集できるように ###
  
  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  ### FaceBook Utility ###  
  def self.create_unique_email
    User.create_unique_string + "@sample.com"
  end
  
  def self.create_unique_string
    SecureRandom.uuid
  end
  
  ### Relation Utility ###
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
  ### User Sarch Utility ###
  def self.searchUser(area,kiryoku,age)

    # 検索条件が全く設定されていなければ返却
    if area.blank? && kiryoku.blank? && age.blank?
      return
    end
    
    @serach_keys = Array.new
    @serach_values = Array.new

    # 地域チェック
    if area.present?
      @serach_keys.push('area')
      @serach_values.push(area)
    end
    
    # 棋力チェック
    if kiryoku.present?
      @serach_keys.push('kiryoku')
      @serach_values.push(kiryoku)
    end
    
    # 年齢チェック
    if age.present?
    
      case age
    
      when "10代前半"
        @ageRange = 10..14 
      when "10代後半"
        @ageRange = 15..19 
      when "20代前半"
        @ageRange = 20..24 
      when "20代後半"
        @ageRange = 25..29
      when "30代前半"
        @ageRange = 30..34
      when "30代後半"
        @ageRange = 35..39
      when "40代前半"
        @ageRange = 40..44
      when "40代後半"
        @ageRange = 45..49
      when "50代前半"
        @ageRange = 50..54
      when "50代後半"
        @ageRange = 55..59
      when "60歳以上"
        @ageRange = 60..120

      end
      
      @serach_keys.push('age')
      @serach_values.push(@ageRange)
    end
    
    @users = User.search(@serach_keys,@serach_values)
    @users
    
  end
  

    scope :search, lambda { |search_keys, search_values| 

    conditions = nil
    search_keys.each_with_index do |search_key, i|
      
      if conditions.present?
        
        if(search_key == "age") 
          conditions = conditions.and(arel_table[search_key].in(search_values[i]))
        else 
          conditions = conditions.and(arel_table[search_key].eq(search_values[i]))
        end
        
      else
        if(search_key == "age") 
          conditions = arel_table[search_key].in(search_values[i])
        else
          conditions = arel_table[search_key].eq(search_values[i])
        end
        
      end 
    end

    where(conditions)
  }
  
end
