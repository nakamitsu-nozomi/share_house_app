class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validates :user_id,uniqueness:{
    scope: :house_id,
    message: "は同じ物件を2回以上保存はできません"
  }
end
