class Ingredient < ApplicationRecord
  has_many :weekly_ingredients, dependent: :destroy
  has_many :weekly_ingredient_lists, through: :weekly_ingredients
end
