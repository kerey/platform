class AddHomeworkToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :homework, :boolean, default: false
  end
end
