class Order < ApplicationRecord
  belongs_to :user
  belongs_to :weekly_ingredient_list

  validates :delivery_date, :delivery_location, :amount_portion, :total_order_price, presence: true

  delegate :weekly_ingredients, to: :weekly_ingredient_list

end
