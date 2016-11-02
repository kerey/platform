class AddCommentAndPointsToAnswer < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :comment, :text
  	add_column :answers, :points, :integer   
  end
end
