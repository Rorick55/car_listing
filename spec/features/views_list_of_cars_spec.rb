require 'rails_helper'

feature 'views a list of cars', %Q{
  As a salesperson I would like to
  go to a page and view all the
  cars I have for sale.
} do

  # I can navigate to a page with all my cars in it.
  # It should have the cars manufacurer, year, and mileage

  scenario 'salesperson views a list of cars' do
    manufacturer = FactoryGirl.create(:manufacturer)
    cars = FactoryGirl.create_list(:car, 3, manufacturer: manufacturer)

    visit cars_path

    cars.each do |car|
      expect(page).to have_content car.manufacturer.name
      expect(page).to have_content car.year
      expect(page).to have_content car.mileage
    end
  end
end
