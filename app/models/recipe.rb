class Recipe < ApplicationRecord

  include PgSearch::Model

  pg_search_scope :global_search,
  against: [:name, :description],
    associated_against: {
      categories: [:name],
      levels: [:name]
    },
    using: {
      tsearch: { any_word: true }
    }

  acts_as_taggable_on :categories
  acts_as_taggable_on :levels

  $categories = ["Meat", "Veggie", "Pasta", "Salad", "Soup", "Seafood", "Snack", "Vegetables", "Sweet/Dessert", "Bread and Pastries"]
  $levels = ["Easy", "Medium", "Difficult", "Expert"]

  # CATEGORIES = ["Meat", "Veggie", "Pasta", "Salad", "Soup", "Seafood", "Snack", "Vegetables", "Sweet/Dessert", "Bread and Pastries"]
  # LEVELS = ["Easy", "Medium", "Difficult", "Expert"]

  belongs_to :user
  belongs_to :weekly_ingredient_list

  has_many :ingredients, through: :weekly_ingredient_list
  has_many :comments, dependent: :destroy
  has_many :done_recipes, dependent: :destroy
  has_many :ratings, through: :done_recipes

  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user

  has_one_attached :photo

  validates :name, :description, :serving_time, :photo, :video, presence: true
  validates_presence_of :category_list, :level_list
  # validates :category, presence: true, inclusion: { in: $categories }
  # validates :level, presence: true, inclusion: { in: $levels }

  def description_teaser
    # truncate(self.description, :length => 30)
    self.description.slice(0..60)
  end

  def favorite_by(user)
    FavoriteRecipe.find_by(recipe: self, user: user)
  end

  def done_recipe_by(user)
    DoneRecipe.find_by(user: user, recipe: self)
  end

end
