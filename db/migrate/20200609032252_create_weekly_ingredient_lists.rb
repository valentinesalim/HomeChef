class CreateWeeklyIngredientLists < ActiveRecord::Migration[6.0]
  def change
    create_table :weekly_ingredient_lists do |t|
      t.datetime :date
      t.boolean :published

      t.timestamps
    end
  end
end
