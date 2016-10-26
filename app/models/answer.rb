class Answer < ApplicationRecord
  attr_accessor :answer_file
  
  belongs_to :lesson
  belongs_to :student, class_name: "User"

  mount_uploader :answer_file, AnswerFileUploader
end
