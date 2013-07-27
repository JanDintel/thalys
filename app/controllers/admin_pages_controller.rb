class AdminPagesController < ApplicationController
  def dashboard
    @posts = Post.order("created_at DESC")
  end
end
