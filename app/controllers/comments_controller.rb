class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    # binding.pry
    @comment = @post.comments.create(comment: params[:comment][:comment], user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end
