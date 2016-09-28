class Lesson < ApplicationRecord
	belongs_to :course
	default_scope -> {order(created_at: :desc)}
	validates :course_id, presence: true
	validates :title, presence: true, length: { maximum: 255 }
end
