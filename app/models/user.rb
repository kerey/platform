class User < ApplicationRecord
  attr_accessor :remember_token, :avatar
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :teachings, class_name: "Course", foreign_key: :teacher_id

  # has_many name: "Relationship", foreign_key: "course_id", dependent: :destroy
  has_many :relationships  
  has_many :courses, through: :relationships
  has_many :answers 
  mount_uploader :avatar, AvatarUploader

  rails_admin do
  end
  scope :instanceprojects, lambda { |user|
      where("projects.instance_id = ?", user.instance_id)
  }
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
  def answered(homework_id)
    Answer.exists?(user_id: self.id, homework_id: homework_id)
  end
  def getAnswer(homework_id)
    self.answers.find_by(homework_id: homework_id)
  end
end