class House < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :house_rent, presence: true
  validates :service_fee, presence: true
  validates :station, presence: true
  validates :access, presence: true,numericality: { less_than: 60 }
  validates :house_size, presence: true
  validates :convenience, presence: true
  validates :area_id,presence: true

  belongs_to :area
  belongs_to :user
  mount_uploader :house_image, ImageUploader
  has_many :clips,dependent: :destroy
end
