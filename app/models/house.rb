class House < ApplicationRecord
  belongs_to :user
  
  mount_uploader :house_image, ImageUploader
end
