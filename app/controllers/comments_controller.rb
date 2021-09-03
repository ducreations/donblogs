class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog.comments.create(comment_params)
    if @blog.comments.create
      redirect_to blog_path(@blog)
    end
    # @comment = current_user.comments.new(comment_params)
    # if @comment.save
    #   redirect_to blog_path
    # end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete

    blog = Blog.find(params[:blog_id])
    redirect_to blog_path(blog),
      notice: "Your comment has been deleted"
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
      # .merge(blog_id: params[:blog_id])
  end

end
