class Course < ApplicationRecord
  	attr_accessor :remember_token, :avatar
	belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
	has_many :lessons, dependent: :destroy
	has_many :homeworks, dependent: :destroy
	has_many :relationships	
	has_many :students, through: :relationships
  	mount_uploader :avatar, AvatarUploader

  	rails_admin do
    	configure :teacher do
      		label 'Owner of this course'
    	end
  	end
	
	def register(student)
	  	relationships.create(student_id: student.id)
	end
	def unregister(student)
	  	relationships.find_by(student_id: student.id).destroy
	end
	def registered?(student_id, course_id)
	  	# relationships.include?(student)
	  	Relationship.exists?(student_id: student_id, course_id: course_id)
	end
	
end
