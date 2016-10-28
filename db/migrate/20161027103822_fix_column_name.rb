class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :answers, :lesson_id, :homework_id
  end
end
