class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :house
  self.inheritance_column = :_type_disabled 
end
