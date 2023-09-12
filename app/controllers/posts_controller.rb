class PostsController < ApplicationController
  # actions
  # new: tra ra view de tao post
  # create: khi minh an nut tao, no se submit form
  # link_to 'New post'

  before_action :authenticate_user!, expect: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")  
  end

  def new
    @post = Post.new
  end

  def edit
   @post = Post.find(params[:id]) 
  end

  def update
   @post = Post.find(params[:id]) 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    # binding.pry
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    # binding.pry
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
   
  def post_params 
    params.require(:post).permit(:title, :content, :avatar)
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "you need to Sign In or Sign Up to continue" unless user_signed_in?
  end

end