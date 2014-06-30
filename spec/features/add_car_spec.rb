require 'rails_helper'

feature 'adds a new car', %Q{
  As a salesperson I want to be
  able to add a new car to my listing
  so that potential buyers may see what
  I have available.
} do

  # I must specify the manufacturer, color, year, and mileage of the car.
  # Only years from 1920 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'salesperson inputs valid information' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_car_path

    select manufacturer.name, from: 'Manufacturer'
    fill_in 'Color', with: 'Pink'
    fill_in 'Year', with: '1992'
    fill_in 'Mileage', with: '20000'
    fill_in 'Description', with: 'Great car'
    click_on 'Submit'

    expect(page).to have_content 'Toyota'
    expect(page).to have_content '1992'
    expect(page).to have_content '20000'
    expect(page).to have_content 'Successfully added this car'
  end

  scenario 'salesperson inputs invalid information' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_car_path

    click_on 'Submit'

    expect(page).to have_content "There was a problem saving your submission"
    expect(page).to_not have_content 'Successfully'
  end
end
