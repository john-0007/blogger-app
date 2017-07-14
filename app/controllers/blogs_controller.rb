class BlogsController < ApplicationController
    
    def index 
      @blogs = Blog.all
    end
    def new
        @blogs = Blog.new
    end
    def create
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blogs_path
      else
        
     end
    end
    def show
      #@blog = Blog.where(id: params[:id]).first
      @blog = Blog.find_by(id: params[:id])
    end
      
    def edit
      @blogs = Blog.where(id: params[:id]).first
    end
   def update
     @blog = Blog.where(id: params[:id]).first
      if @blog.update_attributes(blog_params)
        redirect_to blogs_path
      else
            
      end
   end
  def destroy
        @blog = Blog.where(id: params[:id]).first
        if @blog.destroy
            redirect_to blogs_path
        else
        end
    end
    
  private
    def blog_params
        params.require(:blog).permit(:title,:body,:description)
    end
end


