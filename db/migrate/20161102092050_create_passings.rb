class CreatePassings < ActiveRecord::Migration[5.0]
  def change
    create_table :passings do |t|
    	t.integer :lesson_id
      	t.integer :student_id
      	t.boolean :pass, default: false
      	t.timestamps
    end
    add_index :passings, :lesson_id
    add_index :passings, :student_id
    add_index :passings, [:lesson_id, :student_id], unique: true
  end
end
