class PostsController < ApplicationController

  before_action :set_post_params, only: [:show]
  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def set_post_params
    @post = Post.find(params[:id])
  end
end
