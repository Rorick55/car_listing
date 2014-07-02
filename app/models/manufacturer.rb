class Manufacturer < ActiveRecord::Base
  has_many :cars
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true

  def car_count
    cars.count
  end
end
