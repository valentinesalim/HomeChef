class AddAmountToWeeklyIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :weekly_ingredients, :amount, :integer
  end
end
