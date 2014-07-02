class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "Successfully added #{@manufacturer.name}"
      redirect_to manufacturers_path
    else
      render :new
    end
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
