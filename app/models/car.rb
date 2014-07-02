class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates :color, presence: true
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true
  validates :year, presence: true,
    numericality: {greater_than: 1919, less_than_or_equal_to: Time.now.year}
end
