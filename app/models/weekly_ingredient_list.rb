class WeeklyIngredientList < ApplicationRecord
  has_many :weekly_ingredients, dependent: :destroy
  has_many :ingredients, through: :weekly_ingredients

  validates :date, :menu_name, :price_per_portion, presence: true
  
  # def add_ingredient(ingredient, amount)
  #   WeeklyIngredient.create(ingredient: ingredient, amount: amount, weekly_ingredient_list: self)
  # end
end
