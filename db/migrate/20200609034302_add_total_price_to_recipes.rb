class AddTotalPriceToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :total_price, :integer
  end
end
