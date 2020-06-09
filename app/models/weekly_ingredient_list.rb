class WeeklyIngredientList < ApplicationRecord
  has_many :weekly_ingredients, dependent: :destroy
  has_many :ingredients, through: :weekly_ingredients
end
