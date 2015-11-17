class PostsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]

  def index
  end

  def new
  end

  def create
  end
end
