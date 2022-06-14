class RenamePriceToDifficulty < ActiveRecord::Migration[6.1]
  def change
    rename_column :foods, :price, :difficulty
  end
end
