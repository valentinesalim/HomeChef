class DoneRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_one :rating

end
