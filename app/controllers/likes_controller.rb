class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  
  # nhiem cu can lam
  # check xem da like hay chua
  # cach check: neu like roi => trong db co ton tai record giua user va post
  # neu chua co => chua like, can them vao db => like
  # check like roi: like -> chua like (xoa trong db)
  # check neu chua like: chua like -> like (them vao trong db)
  def action
    # user_id => lay tu current_user
    # post_id => chua co => can truyen theo kieu params
    # cai loi: undefined method -> khong ton tai mothod nay.
    # objec.liked_by? => undefined
    like = current_user.likes.find_by(post_id: params[:post_id])
    # find_by tim du lieu trar ve, neu khong thay no se tra vef null
    if like.present?
      # no dang duocj like
      # can phai xoa no
      # => like -> khong like
      like.destroy
      isLike = false
    else
      current_user.likes.create(post_id: params[:post_id])
      isLike = true
    end
    redirect_to post_path(@post, is_like: isLike)
  end

  # def create
  #   like = current_user.like.new(like_params)
  #   if !like.save
  #     flash[:notice] = Like.errors.full_mesages.to_sentence
  #   end

  #   redirect_to @like.post
  # end

  # def destroy
  #  @like = current_user.likes.find_by(params[:id])
  #  post = Like.post
  #  @like.destroy
  #  redirect_to post 
  # end

  private

  def set_post
    @post = Post.find(params[:post_id]) 
    # params.require(:like).permit(:post_id)
  end

end