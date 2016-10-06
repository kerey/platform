class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
    add_index :relationships, :course_id
    add_index :relationships, :student_id
    add_index :relationships, [:course_id, :student_id], unique: true
  end
end
