class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.integer :price_per_unit
      t.string :image

      t.timestamps
    end
  end
end
