class AddAmountPortionAndWeeklyIngredientListIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :amount_portion, :integer
    add_reference :orders, :weekly_ingredient_list, index: true
    add_foreign_key :orders, :weekly_ingredient_lists
  end
end
