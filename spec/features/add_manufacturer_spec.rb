require 'rails_helper'

feature 'adds a manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

  scenario 'salesperson inputs valid input' do
    visit new_manufacturer_path

    fill_in 'Name', with: 'Toyota'
    fill_in 'Country', with: 'Japan'
    click_on 'Submit'

    expect(page).to have_content 'Japan'
    expect(page).to have_content 'Toyota'
    expect(page).to have_content 'Successfully added Toyota'
  end

  scenario 'salesperson inputs invalid input' do
    visit new_manufacturer_path

    click_on 'Submit'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Successfully"
  end

  scenario 'salesperson inputs duplicate input' do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit new_manufacturer_path

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content 'has already been taken'
    expect(page).to_not have_content 'Successfully'
  end
end
