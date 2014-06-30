class CarsController < ApplicationController
  def index
    @cars = Car.order('year')
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = 'Successfully added this car'
      redirect_to cars_path
    else
      render :new
    end
  end

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :manufacturer_id, :description)
  end

end
