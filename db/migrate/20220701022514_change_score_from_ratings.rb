class ChangeScoreFromRatings < ActiveRecord::Migration[6.1]
  def change
    change_column :ratings, :score, :float
  end
end
