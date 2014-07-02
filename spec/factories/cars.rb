# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color 'pink'
    year 1992
    mileage 20000
    description 'Great car'
    manufacturer
  end
end
