class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	User.find_by_id(session[:user_id]).post.create post_params
  	redirect_to root_path
  end

  private

  def post_params
  	params.require(:user).permit(:title, :link)
  end
end
