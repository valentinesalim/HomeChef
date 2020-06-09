class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  belongs_to :parent_comment, class_name: "Comment", foreign_key: "thread_id", optional: true
  has_many :replies, class_name: "Comment", foreign_key: "thread_id"

end
