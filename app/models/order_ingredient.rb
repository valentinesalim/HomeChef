class OrderIngredient < ApplicationRecord
  belongs_to :order
  belongs_to :ingredient

  validates :amount, presence: true

end
