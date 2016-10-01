class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :short_description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :courses, [:user_id, :created_at]
  end
end
