class AddAnswerFileToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :answer_file, :string

  end
end
