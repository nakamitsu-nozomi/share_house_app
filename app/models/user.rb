class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :user_icon, ImageUploader
  validates :experience, inclusion: { in: [true, false] }
  has_many :houses, dependent: :destroy
end
