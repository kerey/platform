class Course < ApplicationRecord
	belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
	has_many :lessons, dependent: :destroy
	
	# has_many :registrations, class_name: "Relationship", foreign_key: "student_id", dependent: :destroy
	# has_many :students, through: :registrations
	has_many :relationships	
	has_many :students, through: :relationships
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
