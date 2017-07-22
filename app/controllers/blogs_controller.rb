class BlogsController < ApplicationController
  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(1)
  end

  def show
    # @blog = Blog.where(id: params[:id]).first
    @blog = Blog.friendly.find(params[:id])
  end
end
