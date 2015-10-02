class PostsController < ApplicationController
  before_action :find_post, only: :show

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def show

  end


  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
