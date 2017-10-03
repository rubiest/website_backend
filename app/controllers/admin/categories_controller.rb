class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def new
    @category ||= Category.new
    render
  end

  def create
    @category = Category.create! category_params
    respond_to do |format|
      format.js { redirect_to admin_categories_path, notice: "Category has been added" }
    end
  end

  def destroy
    @category = Category.destroy params[:id]
    respond_to do |format|
      format.js { redirect_to admin_categories_path, notice: "Category has been destroyed" }
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
