class DropTableRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    drop_table :recipe_ingredients
  end
end
