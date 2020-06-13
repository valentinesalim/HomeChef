class WeeklyIngredientList < ApplicationRecord
  has_many :weekly_ingredients, dependent: :destroy
  has_many :ingredients, through: :weekly_ingredients
  has_many :recipes

  validates :date, :menu_name, :price_per_portion, presence: true

  # def add_ingredient(ingredient, amount)
  #   WeeklyIngredient.create(ingredient: ingredient, amount: amount, weekly_ingredient_list: self)
  # end

  def created_this_week?
    date = Date.today
    start_week = date.at_beginning_of_week
    end_week = start_week + 6.days
    # date_beginning_this_week = Date.today.beginning_of_week
    # date_today= Date.today
    WeeklyIngredientList.where(:created_at => start_week..end_week)
  end

end
