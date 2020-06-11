class Recipe < ApplicationRecord
  CATEGORIES = ["Meat", "Veggie", "Pasta", "Salad", "Soup", "Seafood", "Snack", "Vegetables", "Sweet/Dessert", "Bread and Pastries"]
  LEVELS = ["Easy", "Medium", "Difficult", "Expert"]

  belongs_to :user
  belongs_to :weekly_ingredient_list

  has_many :ingredients, through: :weekly_ingredient_list
  has_many :comments, dependent: :destroy
  has_many :done_recipes, dependent: :destroy
  has_many :ratings, through: :done_recipes

  has_one_attached :photo

  validates :name, :description, :serving_time, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :level, presence: true, inclusion: { in: LEVELS }

end
