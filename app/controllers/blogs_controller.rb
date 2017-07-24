class BlogsController < ApplicationController
  def index
    @blogs = Blog.published.order('published_at DESC').page(params[:page]).per(1)
  end

  def show
    # @blog = Blog.where(id: params[:id]).first
    @blog = Blog.friendly.find(params[:id])
  end
end
