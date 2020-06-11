class AddMenuNameAndPricePerPortionToWeeklyIngredientList < ActiveRecord::Migration[6.0]
  def change
    add_column :weekly_ingredient_lists, :price_per_portion, :integer
    add_column :weekly_ingredient_lists, :menu_name, :string
  end
end
