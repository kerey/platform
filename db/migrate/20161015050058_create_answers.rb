class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :lesson_id
      t.integer :student_id

      t.timestamps
    end
    add_index :answers, :lesson_id
    add_index :answers, :student_id
  end
end
