class User < ActiveRecord::Base
  
  #association
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  #peperclip
  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  
  #validates
  validates :name, presence: true, length:  { maximum: 30 }
  validates :name, uniqueness: true
  validates :password, length:  { minimum: 8 }, on: [:new] 
  validate :sex_check
  validate :birthday_check
  validate :area_check
  validate :password_confirmation_check, on: [:new]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
         
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    
    unless user
    
      birthday = self.birthdayEditer(auth.extra.raw_info.birthday)
      age = self.ageEditer(birthday)
      sex = self.sexEditer(auth.extra.raw_info.gender)
      location = locationEditer(auth.info.location)
      imageUrl = auth.info.image + "?type=large"
      require 'open-uri'
      require 'open_uri_redirections'
      image = open(imageUrl, :allow_redirections => :safe)
    
      user = User.new(
          uid: auth.uid,
          provider: auth.provider,
          name: auth.info.name,
          email: auth.info.email,
          image: image,
          birthday: birthday,
          age: age,
          sex: sex,
          area: location,
          password: Devise.friendly_token[10, 15],
          confirmed_at: Time.now)
      user.save
    end

    user
    
  end
  
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
  
  # relationship utility
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
  # original varidate method 
  def sex_check
    if sex.blank?
        errors.add(:sex, "を入力してください")
    end  
  end
  
  def birthday_check
    if birthday.empty?
        errors.add(:birthday, "を入力してください")
      else if ! birthday =~ /\dD{4}\/\dD{2}\/\dD{2}/
        errors.add(:birthday, "の書式が正しくありません \n/は自動で入力されます")
      else
        birthdayArr = Array.new
        birthdayArr = birthday.split('/')
        year = birthdayArr[0].to_i
        month = birthdayArr[1].to_i
        day = birthdayArr[2].to_i
        unless Date.valid_date?(year,month,day)
          errors.add(:birthday, "に存在しない日付が入力されています")
        end
      end
    end
  end
    
  def area_check
    if area.empty?
        errors.add(:area, "を入力してください")
    end
  end
  
  def kiryoku_check
    if kiryoku.empty?
        errors.add(:kiryoku, "を入力してください")
    end 
  end
  
  def password_confirmation_check
    if password.present?
      if password_confirmation.empty?
        errors.add(:password_confirmation, "を入力してください")
      end
    end
  end
  
  #faceBook data edit
  def self.sexEditer(sex)
    if sex == "male"
      return 1
    else
      return 2
    end
  end
  
  def self.birthdayEditer(birthday)
    year = birthday[6,4]
    month = birthday[0,2]
    day = birthday[3,2]
    userBirthday = year + "/" + month + "/" + day
    return userBirthday
  end
  
  def self.ageEditer(userBirthday)
    birthday = Date.strptime(userBirthday,'%Y/%m/%d')
    birthdayInt = birthday.strftime("%Y%m%d").to_i
    todayInt = Date.today.strftime("%Y%m%d").to_i
    return (todayInt - birthdayInt) / 10000
  end
  
  def self.locationEditer(location)
    userLocationArr = location.split(',')
    userPrefectures = userLocationArr[1].strip
    pref = JpPrefecture::Prefecture.find name: userPrefectures
    return pref.name
  end

  def self.searchUser(area,kiryoku,age,myid)

    if area.blank? && kiryoku.blank? && age.blank?
      return User.all.where.not(id: myid)
    end
    
    serach_keys = Array.new
    serach_values = Array.new

    if area.present?
      serach_keys.push('area')
      serach_values.push(area)
    end
    
    if kiryoku.present?
      serach_keys.push('kiryoku')
      serach_values.push(kiryoku)
    end
    
    if age.present?
      ageArr = ["10代前半","10代後半","20代前半","20代後半","30代前半","30代後半","40代前半","40代後半","50代前半","50代後半","60歳以上"]
      rangeArr = [10..14 , 15..19, 20..24, 25..29, 30..34, 35..39, 40..44, 45..49, 50..54, 55..59, 60..150]
      
      for index in 0..ageArr.length - 1 do
        if age == ageArr[index]
          ageRange = rangeArr[index]
        end
      end
      
      serach_keys.push('age')
      serach_values.push(ageRange)
    end
    
    users = User.getUser(serach_keys,serach_values,myid)
    users
    
  end
  
  def self.getUser (search_keys, search_values, myid)
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
    
    conditions = conditions.and(arel_table["id"].not_eq(myid))
    where(conditions)
  end
  
  def self.getPartnerInf(partner_id)
      partner_inf = User.find(partner_id)
      partner_inf
  end
  
  def self.checkFriend(friends, partner_id)
      if friends.where(uid: partner_id).nil?
        friend_flag = false
      else
        friend_flag = true
      end
      friend_flag
  end
  
end
