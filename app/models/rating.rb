class Rating < ApplicationRecord
  belongs_to :done_recipe

  validates :star, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true, length: { minimum: 10 }
end
