class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    # @blog = Blog.where(id: params[:id]).first
    @blog = Blog.friendly.find(params[:id])
  end
end
