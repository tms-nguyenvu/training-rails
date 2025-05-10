class PostsController < ApplicationController

  before_action :set_post_params, only: [:show]
  def index
    # binding.pry
    #
    @pagy, @posts = pagy(Post.published.recent)

    if params[:q] && params[:q] != ''
      @posts = @posts.search(params[:q])
    end

  end

  def show
    @post = Post.find(params[:id])
    # binding.pry
    @comments = @post.comments.order(created_at: :desc)
  end

  private
  def set_post_params
    @post = Post.find(params[:id])
  end
end
