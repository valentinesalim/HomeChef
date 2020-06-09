class Order < ApplicationRecord
  belongs_to :user

  has_many :order_ingredients, dependent: :destroy
  has_many :ingredients, through: :order_ingredients


end
