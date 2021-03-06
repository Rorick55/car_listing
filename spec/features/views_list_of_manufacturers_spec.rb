require 'rails_helper'

feature 'views a list of manufacturers', %Q{
  As a salesperson I want to be able to visit a
  page with a list of all the manufacturers I have
  inputed. I want each to have the manufacturer's
  name and how many cars I have with that
  manufacturer.
} do

  #I can visit a page with all the manufacturers
  #I can see how many cars I have with each manufacturer.

  scenario 'salesperson views a list of manufacturers' do
    manufacturer1 = FactoryGirl.create(:manufacturer)
    manufacturers = FactoryGirl.create_list(:manufacturer, 3)
    cars = FactoryGirl.create_list(:car, 3, manufacturer: manufacturer1)

    visit manufacturers_path

    expect(page).to have_content '3'
    manufacturers.each do |manufacturer|
      expect(page).to have_content manufacturer.name
    end
  end
end
