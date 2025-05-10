class Admin::CategoriesController < Admin::BaseController
  
  before_action :set_category_params, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    flash.clear
  end

  def show; end
  
  def edit
    flash.clear
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      return redirect_to admin_categories_path
    else
      flash[:alert] = "Failed to create category."
      render :new 
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "Failed to update category."
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Category was successfully deleted."
      redirect_to admin_categories_path
    else
      flash[:notice] = "Failed to delete category."
      redirect_to admin_categories_path
    end
  end

  private

    def set_category_params
      @category = Category.find(params[:id])
    end
    def category_params
      params.require(:category).permit(:name)
    end

end