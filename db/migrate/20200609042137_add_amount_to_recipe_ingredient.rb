class AddAmountToRecipeIngredient < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :amount, :integer
  end
end
