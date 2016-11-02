class Lesson < ApplicationRecord
	belongs_to :course
	has_many :videos
	default_scope -> {order(created_at: :desc)}

	validates :course_id, presence: true
	validates :title, presence: true, length: { maximum: 255 }
	
	def getAnswer(student, content, file)
	  	answers.create(student_id: student.id, content: content, answer_file: file)
	end
end
