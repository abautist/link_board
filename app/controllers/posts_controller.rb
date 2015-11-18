class PostsController < ApplicationController
  before_action :is_authenticated?, except: [:index]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if post.valid?
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      messages = post.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
      p = Post.find params[:id]
    if current_user.id != p.user.id
      flash[:danger] = 'Cannot delete another person\'s post'
      redirect_to root_path
    else  
      p.comment.clear
      p.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
