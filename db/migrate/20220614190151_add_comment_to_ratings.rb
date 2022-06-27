class AddCommentToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :comment, :text
  end
end
