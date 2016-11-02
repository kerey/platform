class Answer < ApplicationRecord
  attr_accessor :answer_file

  belongs_to :student, class_name: "User", foreign_key: :student_id
  belongs_to :homework
  mount_uploader :answer_file, AnswerFileUploader
end
