class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
    	t.string :title
    	t.text :short_description
    	t.integer :points
    	t.references :course, foreign_key: true

      	t.timestamps
    end
  end
end
