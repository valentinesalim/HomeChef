class CreateWeeklyIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :weekly_ingredient_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
