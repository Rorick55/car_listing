class CarsController < ApplicationController
  def index
    @cars = Car.order('year')
  end

  def show
    @car = Car.find(params[:id])
  end

end
