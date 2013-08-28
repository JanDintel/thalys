class AdminPagesController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @posts = Post.order("created_at DESC")
  end

  def settings
    if Properties.first
      @properties = Properties.first
    else
      @properties = Properties.new
    end
  end
end
