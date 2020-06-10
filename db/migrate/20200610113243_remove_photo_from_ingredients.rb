class RemovePhotoFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :image, :string
  end
end
