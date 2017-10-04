class Admin::PropertiesController < AdminController
  before_action :find_property, only: [:edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property ||= Property.new
    render
  end

  def create
    @property = Property.new property_params
    if @property.save
      redirect_to admin_properties_path, notice: 'Property created!'
    else
      render 'new'
    end
  end

  def edit
    if @property
      render
    else
      redirect_to admin_properties_path, notice: 'Property not found!'
    end
  end

  def update
    if @property.update_attributes property_params
      redirect_to admin_properties_path, notice: 'Property updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @property.active = false
    @property.save

    redirect_to admin_properties_path
  end

  private

  def property_params
    params.require(:property).permit(:identifying_name, :display_name, :active)
  end

  def find_property
    @property = Property.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to(admin_properties_url, :notice => 'Record not found')
  end
end
