class Post < ApplicationRecord
  belongs_to :user,optional: true
  has_many   :post_category_relations
  has_many   :categories, through: :post_category_relations
  has_many   :likes, dependent: :destroy
  has_many   :iine_users, through: :likes, source: :user

  validates :title, presence: true
  # mount_uploader :canvas_image, ImageUploader
  mount_uploader :image, ImageUploader
  


  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?)', "%#{search}%")
  end

   # マイクロポストをいいねする
   def iine(user)
    likes.create(user_id: user.id)
  end

  # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）

   # 現在のユーザーがいいねしてたらtrueを返す
  def iine?(user)
    iine_users.include?(user)
  end
end
