class Facility < ApplicationRecord
  has_many :houses_facilities
  has_many :houses, through: :houses_facilities
end
