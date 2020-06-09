class Ingredient < ApplicationRecord
  has_many :weekly_ingredients, dependent: :destroy
  has_many :weekly_ingredient_lists, through: :weekly_ingredients

  validates :name, :unit, :price_per_unit, presence:true

  # set default image & uncomment the following line after cloudinary implementation
  # has_one_attached :photo
end
