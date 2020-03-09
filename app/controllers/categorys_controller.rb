class CategorysController < ApplicationController

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
