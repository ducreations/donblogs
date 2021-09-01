class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :id, only: [:edit, :update]

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
        notice: "Your blog has been published"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path,
        notice: "Blog successfully updated"
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :author, :intro, :body)
  end

  def id
    @blog = Blog.find(params[:id])
  end

end
