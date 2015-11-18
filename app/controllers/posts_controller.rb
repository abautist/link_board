class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	current_user.post.create post_params
  	redirect_to root_path
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    p = Post.find params[:id]
    p.comment.clear
    p.destroy
    redirect_to root_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
