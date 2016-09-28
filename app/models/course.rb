class Course < ApplicationRecord
	belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
	has_many :lessons, dependent: :destroy
end
