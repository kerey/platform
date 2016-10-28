class AddCommentToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :comment, :text, default: ""

  end
end
