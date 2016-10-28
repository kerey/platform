class Lesson < ApplicationRecord
	belongs_to :course
	has_many :videos
	validates :course_id, presence: true
	validates :title, presence: true, length: { maximum: 255 }
	default_scope -> {order(created_at: :desc)}
	
end
