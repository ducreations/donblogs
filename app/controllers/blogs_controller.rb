class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path,
        notice: "Blog successfully posted"
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :author, :intro, :body)
  end

end
