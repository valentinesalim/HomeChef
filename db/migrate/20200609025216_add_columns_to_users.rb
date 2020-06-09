class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :address, :string, null: false, default: ""
    add_column :users, :profile_photo, :string, null: false
  end
end
