class CommentsController < ApplicationController
  def create
    @blog = Blog.where(id: params[:blog_id]).first
    @comment = @blog.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to blog_path(@blog)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
