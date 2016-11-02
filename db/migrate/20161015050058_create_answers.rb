class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
    add_index :answers, :lesson_id
    add_index :answers, :user_id
  end
end
