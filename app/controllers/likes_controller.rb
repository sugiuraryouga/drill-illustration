class LikesController < ApplicationController
  
  
  def create
    @post = Post.find(params[:post_id])
    @post.iine(current_user)
  
    
    
    # @post = Post.find(params[:post_id])
    # unless @post.iine?(current_user)
    #   @post.iine(current_user)
    #   respond_to do |format|
    #     format.html { redirect_to request.referrer || root_url }
    #     format.js
    #   end
    # end
  end

  def destroy
    @post = Like.find_by(post_id: params[:id])
    @post.destroy
    redirect_to post_path(@post.post_id)
  end
  
  #  @post = Like.find_by(post_id: params[:id])
  #    @post.destroy
  #    respond_to do |format|
  #      format.html { redirect_to request.referrer || root_url }
  #      format.js
  #    end
  # end
  



end
