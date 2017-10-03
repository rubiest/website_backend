class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category ||= Category.new
    render
  end

  def create
    @category = Category.create!(category_params)
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "Category has been added" }
      format.js { redirect_to admin_categories_path, notice: "Category has been added" }
    end
  end

  def destroy
    @category = Category.destroy(params[:id])
    redirect_to admin_categories_path, notice: "Category has been removed"
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
