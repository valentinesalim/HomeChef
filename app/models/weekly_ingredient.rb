class WeeklyIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :weekly_ingredient_list

  validates :amount, presence: true
end
