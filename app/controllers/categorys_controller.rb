class CategorysController < ApplicationController
  def index
   @categorys=Category.all
  end

  # ここ以下は管理者のみのadminにする
  def new
    @post = Category.new
  end

  def create
    Post.create(category_params)
  end

  private
  def category_params
    params.require(:post).permit(:title)
  end

end
