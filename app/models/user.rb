class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :user_icon, ImageUploader
  validates :experience, inclusion: { in: [true, false] }
  validates :adress, presence: true
  validates :name, presence: true,length: {maximum: 20}
  has_many :houses, dependent: :destroy
end
