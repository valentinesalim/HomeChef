class RemoveTotalPriceFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :total_price, :integer
  end
end
