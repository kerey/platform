class ChangeColumnNameToAnswers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :answers, :student_id, :user_id
  end
end
