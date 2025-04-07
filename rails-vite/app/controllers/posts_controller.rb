class PostsController < ApplicationController

  before_action :set_post_params, only: [:show]
  def index
    @posts = Post.published

    if params[:q] && params[:q] != ''
      @posts = @posts.search(params[:q])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def set_post_params
    @post = Post.find(params[:id])
  end
end
