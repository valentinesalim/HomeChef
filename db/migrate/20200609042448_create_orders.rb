class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :delivery_date
      t.string :delivery_location
      t.boolean :confirmed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
