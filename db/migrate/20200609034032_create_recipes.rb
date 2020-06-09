class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :serving_time
      t.string :level
      t.boolean :published
      t.references :user, null: false, foreign_key: true
      t.references :weekly_ingredient_list, null: false, foreign_key: true
      t.string :photo
      t.string :video

      t.timestamps
    end
  end
end
