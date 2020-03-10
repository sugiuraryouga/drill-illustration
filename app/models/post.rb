class Post < ApplicationRecord
  belongs_to :user,optional: true
  has_many   :comments
  has_many   :post_category_relations
  has_many   :categories, through: :post_category_relations

  validates :title, presence: true
  mount_uploader :image, ImageUploader
end
