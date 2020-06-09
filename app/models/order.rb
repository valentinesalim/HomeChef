class Order < ApplicationRecord
  belongs_to :user

  has_many :order_ingredients, dependent: :destroy
  has_many :ingredients, through: :order_ingredients

  validates :delivery_date, :delivery_location, presence: true
  validates :confirmed, inclusion: [true, false], default: false
end
