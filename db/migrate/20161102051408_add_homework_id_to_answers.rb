class AddHomeworkIdToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :homework_id, :integer  
  end
end
