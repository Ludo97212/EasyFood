class RemoveDifficultyFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :difficulty, :float
  end
end
