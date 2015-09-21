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
    puts "Auth パラメータチェック"
    p auth
    p auth.uid
    p auth.provider
    p auth.info.name
    p auth.info.email
    p auth.info.user_birthday
    user = User.where(uid: auth.uid, provider: auth.provider).first
    
    unless user
    
       user = User.new(
          #facebook available items
          uid: auth.uid,
          provider: auth.provider,
          name: auth.info.name,
          email: auth.info.email,
          #image: auth.info.image,
          #birthday: auth.info.user_birthday,
          
          #email: User.create_unique_email,
          password: Devise.friendly_token[10, 15],
          confirmed_at: Time.now
          )
      
      p "てすとてすと"
      
      p user
      
      user.save
      
      p "てすとてすと"
      
      p user
    
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
    if area.nil? && kiryoku.nil? && age.nil?
      return
    end
    
    # 地域チェック
    if ! area.nil?
      @area = User.where(area: area)
      @areaSql = @area.where_values.reduce
    end
    
    # 棋力チェック
    if ! kiryoku.nil?
      @kiryoku = User.where(kiryoku: kiryoku)
      @kiryokuSql = @kiryoku.where_values.reduce
    end
    
    # 年齢チェック
    if ! age.nil?
    
      case age
    
      when "10代"
        @age_str = "10..19 "
      when "20代前半"
        @age_str = "20..24 "
      when "20代後半"
        puts "とおったよ！"
        @age_str = "25..29 "
      when "30代前半"
        @age_str = "30..34 "
      when "30代後半"
        @age_str = "35..39 "
      when "40代前半"
        @age_str = "40..44 "
      when "40代後半"
        @age_str = "45..49 "
      when "50代前半"
        @age_str = "50..54 "
      when "50代後半"
        @age_str = "55..59 "
      when "60歳以上"
        @age_str = "60.. "
    　end
    　
      end
      
      @age = User.where(age: @age_str)
      @ageSql = @age.where_values
    end
    
    @users = User.where(@areaSql.and @kiryokuSql)
    @users
  end
  
end
