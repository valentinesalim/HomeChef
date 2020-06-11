class DropTableOrderIngredients < ActiveRecord::Migration[6.0]
  def change
    drop_table :order_ingredients
  end
end
