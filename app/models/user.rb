class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :avatar
  
  has_many :teachings, class_name: "Course", foreign_key: :teacher_id
  has_many :relationships  
  has_many :courses, through: :relationships, foreign_key: :student_id
  has_many :answers, foreign_key: :student_id 

  mount_uploader :avatar, AvatarUploader
  
  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
    
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  ###FOR TEACHERS ONLY###########
  def owner?(course)
    self.id == course.teacher_id
  end
  ###FOR STUDENTS ONLY###########
  def answered(lesson_id)
    Answer.exists?(student_id: self.id, homework_id: lesson_id)
  end
  def getAnswer(homework_id)
    self.answers.find_by(homework_id: homework_id)
  end
end