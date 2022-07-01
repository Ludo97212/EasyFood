class ChangeScoreFromRatings2 < ActiveRecord::Migration[6.1]
  def change
    change_column :ratings, :score, :integer
  end
end
