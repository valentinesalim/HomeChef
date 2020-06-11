class Order < ApplicationRecord
  belongs_to :user
  belongs_to :weekly_ingredient_list

  validates :delivery_date, :delivery_location, :amount_portion, presence: true
end
