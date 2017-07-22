class Admin::BlogsController < Admin::BaseController
  def index
    @blogs = Blog.all
  end
end
