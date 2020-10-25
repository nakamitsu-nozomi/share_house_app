class House < ApplicationRecord
  mount_uploader :house_image, ImageUploader
end
