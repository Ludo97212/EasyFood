class RemoveCommentFromRatings < ActiveRecord::Migration[6.1]
  def change
    remove_column :ratings, :comment, :text
  end
end
