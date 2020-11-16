class HousesFacility < ApplicationRecord
  belongs_to :house
  belongs_to :facility
end
