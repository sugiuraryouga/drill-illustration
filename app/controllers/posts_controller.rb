class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
 
  before_action :move_to_index, except: [:show]
  
  def new
    @post = Post.new
  end

  def create
    binding.pry
    Post.create!(post_params)
  end


  def show
    @categorys=Category.all
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image,:user_id, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
