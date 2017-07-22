class Admin::BlogsController < Admin::BaseController
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

  def edit
    @blogs = Blog.friendly.find(params[:id])
  end

  def update
    @blog = Blog.friendly.find(params[:id])

    redirect_to blogs_path if @blog.update_attributes(blog_params)
  end

  def destroy
    @blog = Blog.friendly.find(params[:id])
    redirect_to blogs_path if @blog.destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :description)
  end
end
