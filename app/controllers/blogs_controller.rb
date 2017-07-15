class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blogs = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    redirect_to blogs_path if @blog.save
  end

  def show
    # @blog = Blog.where(id: params[:id]).first
    @blog = Blog.find_by(id: params[:id])
  end

  def edit
    @blogs = Blog.where(id: params[:id]).first
  end

  def update
    @blog = Blog.where(id: params[:id]).first
    redirect_to blogs_path if @blog.update_attributes(blog_params)
  end

  def destroy
    @blog = Blog.where(id: params[:id]).first
    redirect_to blogs_path if @blog.destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :description)
  end
end
