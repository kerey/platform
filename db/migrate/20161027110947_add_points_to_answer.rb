class AddPointsToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :points, :integer, default: 0
  end
end
