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

  def description_teaser
    # truncate(self.description, :length => 30)
    self.description.slice(0..40)
  end

  def created_this_week?
    date = Date.today
    start_week = date.at_beginning_of_week
    end_week = start_week + 6.days
    # date_beginning_this_week = Date.today.beginning_of_week
    # date_today= Date.today
    Recipe.where(:created_at => start_week..end_week)
  end

end
