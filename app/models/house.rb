class House < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true, length: {maximum: 30}
  validates :house_rent, presence: true
  validates :service_fee, presence: true
  validates :station, presence: true
  validates :access, presence: true,numericality: { less_than: 60 }
  validates :house_size, presence: true
  validates :convenience, presence: true
  validates :area_id,presence: true
  validates :address, presence: true
  validates :kitchen, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :kitchen, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }  
  validates :refrigerator, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :laundry, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :dryer, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :toilet, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :shower, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }
  validates :bathroom, presence: true,numericality: { only_integer: true,greater_than: -1, less_than: 20 }



  belongs_to :area
  belongs_to :user
  mount_uploader :house_image, ImageUploader
  has_many :clips,dependent: :destroy
  has_many :cliped_users,through: :clips,source: :user
  has_many :comments,dependent: :destroy
  has_many :comments_users,through: :comments,source: :user
  has_many :houses_facilities,dependent: :destroy
  has_many :facilities, through: :houses_facilities
  accepts_nested_attributes_for :houses_facilities, allow_destroy: true
  has_many :rooms
  accepts_nested_attributes_for :rooms, allow_destroy: true
  def cliped_by(user)
    clips.find_by(user_id: user&.id).present?
  end

end

