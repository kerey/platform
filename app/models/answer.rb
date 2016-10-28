class Answer < ApplicationRecord
  attr_accessor :answer_file
  
  belongs_to :homework
  belongs_to :user

  mount_uploader :answer_file, AnswerFileUploader
end
