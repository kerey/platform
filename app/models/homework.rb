class Homework < ApplicationRecord
	belongs_to :course
	has_many :answers
	validates :course_id, presence: true
	validates :title, presence: true, length: { maximum: 255 }
	default_scope -> {order(created_at: :desc)}
	
	def getAnswer(student, content, file)
	  	answers.create(student_id: student.id, content: content, answer_file: file)
	end
end