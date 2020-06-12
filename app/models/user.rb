class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :done_recipes, dependent: :destroy
  has_many :ratings, through: :done_recipes
  has_many :comments, dependent: :destroy

  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings, class_name: "User", foreign_key: "followed_id"
  has_many :followed_users, through: :followings, class_name: "User", foreign_key: "follower_id"

  has_many :orders, dependent: :destroy
  has_one_attached :photo


  validates :first_name, :last_name, presence: true

  def avatar
    if self.photo.attached?
      self.photo.key
    else
      "defaultprofile_ra7j6p"
    end
  end
end
