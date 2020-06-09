class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :weekly_ingredient_list

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :done_recipes, dependent: :destroy
  has_many :ratings, through: :done_recipes

end
