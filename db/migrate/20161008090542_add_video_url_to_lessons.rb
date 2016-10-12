class AddVideoUrlToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :video_url, :string, default: ""
  end
end
