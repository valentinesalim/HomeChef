class Recipe < ApplicationRecord
  CATEGORIES = ["Meat", "Veggie", "Pasta", "Salad", "Soup", "Seafood", "Snack", "Vegetables", "Sweet/Dessert", "Bread and Pastries"]
  LEVELS = ["Easy", "Medium", "Difficult", "Expert"]

  belongs_to :user
  belongs_to :weekly_ingredient_list

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :done_recipes, dependent: :destroy
  has_many :ratings, through: :done_recipes

  #uncomment the following after cloudinary implementation
  #has_one_attached :photo

  # check how to let users upload video: youtube or cloudinary?
  #has_one_attached :video

  validates :name, :description, :serving_time, :total_price, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :level, presence: true, inclusion: { in: LEVELS }

end
