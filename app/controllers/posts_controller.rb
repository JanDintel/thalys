class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :created]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post created.'
      redirect_to @post
    else
      flash[:alert] = 'Post not created, something went wrong.'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = 'Post updated.'
      redirect_to @post
    else
      flash[:alert] = 'Post not updated: something went wrong.'
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.delete
      flash[:notice] = 'Post deleted.'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Post not deleted. Something went wrong.'
      redirect_to dashboard_path
    end
  end
  private

    def post_params
      params.require(:post).permit(:id, :title, :content)
    end
end
