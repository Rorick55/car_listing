require 'rails_helper'

feature 'views a car detail page', %Q{
  As a salesperson I would like to
  be able to go to a page where I can look
  at a car's information.
} do

  # I can visit a page with a car's details
  # The page should have all its information

  scenario 'salesperson views a car show page' do
    car = FactoryGirl.create(:car)

    visit car_path(car)

    expect(page).to have_content car.color
    expect(page).to have_content car.manufacturer
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.description
  end
end


