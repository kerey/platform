class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.text :content
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
