
class Admin::DashboardController < Admin::BaseController
  def index
    @posts = Post.all
  end
end
