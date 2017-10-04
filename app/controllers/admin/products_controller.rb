class Admin::ProductsController < AdminController
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  before_action :find_product, only: [:edit, :update, :destroy, :show]

  def index
    @products = @user.products
  end

  def new
    @product ||= Product.new
    render
  end

  def create
    @product = @user.products.new product_params
    if @product.save
      redirect_to admin_products_path, notice: 'Product created!'
    else
      render 'new'
    end
  end

  def show() end

  def edit
    if @product
      render
    else
      redirect_to admin_products_path, notice: 'Product not found!'
    end
  end

  def update
    if @product.update product_params
      redirect_to admin_products_path, notice: 'Product updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      respond_to do |format|
        format.js { redirect_to admin_products_path, notice: "Product has been destroyed" }
      end
    else
      render 'index'
    end
  end

  private

    def set_user
      @user = current_user
    end

    def find_product
      @product = @user.products.friendly.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to(admin_products_url, :notice => 'Record not found')
    end

    def product_params
      params.require(:product).permit(:name, :description, :default_picture, :default_picture_cache, :quantity, :in_stock, :default_price, :sale_price, :category_id)
    end
end
