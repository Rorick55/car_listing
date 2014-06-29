require 'rails_helper'

feature 'viewes manufacturer show page', %Q{
  As a car salesperson
  I want to view a manufacturers info page
  to see it's name, country and a list of
  cars that I have from that manufacturer.
} do

  scenario 'salesperson views a manufacturer show page' do
    manufacturer = FactoryGirl.create(:manufacturer)
    cars = FactoryGirl.create(:car, manufacturer: manufacturer, 3)

    visit manufacturer_path(manufacturer)

    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
    cars.each do |car|
      expect(page).to have_content car.color
      expect(page).to have_content car.year
    end
  end
end
