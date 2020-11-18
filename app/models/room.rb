class Room < ApplicationRecord
  belongs_to :house
  validates :size, presence: true,numericality: { greater_than: -1}
  validates :rent, presence: true,numericality: { only_integer: true,greater_than: -1}
  validates :room_type, presence: true,inclusion: { in: [true, false] }
  validates :vacancy, presence: true,inclusion: { in: [true, false] }
  validates :room_num, presence: true

end