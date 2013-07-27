class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    @posts = Post.all
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

  private

    def post_params
      params.require(:post).permit(:id, :title, :content)
    end
end
