class CategorysController < ApplicationController
  def index
   @categorys=Category.all
   
  end

  # ここ以下は管理者のみのadminにする
  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
  end

  def show
    @category=Category.find(params[:id])
  end

  private
  def category_params
    params.require(:post).permit(:title)
  end

end
