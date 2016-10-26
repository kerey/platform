class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.integer :lesson_id
      t.text :url

      t.timestamps
    end
    add_index :videos, :lesson_id
  end
end
