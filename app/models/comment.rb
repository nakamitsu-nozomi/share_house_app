class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :house
  self.inheritance_column = :_type_disabled 
  validates :title, presence: true, length: {maximum: 20}
  validates :type, inclusion: { in: [true, false] }
  validates :content, presence: true
  validates :star, presence: true,numericality: { only_integer: true,greater_than: 0, less_than: 6 }
  validates :clean_review, presence: true,numericality: { only_integer: true,greater_than: 0, less_than: 6 }
  validates :houserule_review, presence: true,numericality: { only_integer: true,greater_than: 0, less_than: 6 }
  validates :location_review, presence: true,numericality: { only_integer: true,greater_than: 0, less_than: 6 }
  validates :com_review, presence: true,numericality: { only_integer: true,greater_than: 0, less_than: 6 }
end
