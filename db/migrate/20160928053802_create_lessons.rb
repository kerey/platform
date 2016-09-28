class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :short_description
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :lessons, [:course_id, :created_at]
  end
end
