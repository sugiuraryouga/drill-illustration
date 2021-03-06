class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :set_category, only: [:edit, :show,:search]
 
  

  def new
   if user_signed_in?
    @post= Post.new
   else
    redirect_to controller: :categorys,action: :index
   end
  end

  def create
    Post.create(post_params)
  end


  def show
    # @categorys=Category.all
    # @post = Post.find(params[:id]) 
  end
 
  def edit
    # @categorys=Category.all
  # @post = Post.find(params[:id])set_postで定義済み
  end

  def update
    @post = Post.find(params[:id]) 
    @post.update(post_params)
  end

  def search
    # @categorys=Category.all
    @posts = Post.search(params[:keyword])

  end




  private
  def post_params
    params.require(:post).permit(:title, :content, :image,:canvasimage,category_ids: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end

  

  def set_category
    @categorys=Category.all
  end


  
end
