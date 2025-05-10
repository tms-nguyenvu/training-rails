class HomeController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @pagy, @posts = pagy(Post.published.recent, limit: 8)
  end
end
