class RenameColumnDescriptionToRecipe < ActiveRecord::Migration[6.1]
  def change
    rename_column :foods, :description, :recipe
  end
end
