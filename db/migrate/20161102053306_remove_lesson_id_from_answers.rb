class RemoveLessonIdFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :lesson_id, :integer
  end
end
