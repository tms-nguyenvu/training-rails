class Admin::PostsController < Admin::BaseController

  before_action :set_post_params, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
    flash.clear
  end

  def edit
    flash.clear
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to admin_posts_path
    else
      # binding.pry
      # puts @post.errors.full_messages

      flash.now[:alert] = "Failed to create post."
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      flash.now[:alert] = "Failed to update post."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post was successfully deleted."
      redirect_to admin_posts_path
    else
      flash[:notice] = "Failed to delete post."
      redirect_to admin_posts_path
    end
  end

  private
    def set_post_params
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :content, :category_id, :published, images: [])
    end
end
