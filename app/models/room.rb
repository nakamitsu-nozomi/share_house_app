class Room < ApplicationRecord
  enum vacancy: {vacancy:1, no_vacancy:2}
  enum room_type: {private_room:1, domitory:2, room_share: 3}
  belongs_to :house
  validates :size, presence: true,numericality: { greater_than: -1}
  validates :rent, presence: true,numericality: { only_integer: true,greater_than: -1}
  validates :room_num, presence: true
  mount_uploader :image, ImageUploader

end