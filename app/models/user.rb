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
  has_many :clips,dependent: :destroy
  has_many :cliped_houses,through: :clips,source: :house
  has_many :comments,dependent: :destroy
  has_many :comments_houses,through: :comments,source: :house

  def self.guest
    find_or_create_by!(name: "ゲストユーザー",email: "guest@example.com",adress: "東京", experience: true,admin: true) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
