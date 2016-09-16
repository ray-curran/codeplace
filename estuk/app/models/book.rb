class Book < ApplicationRecord
  belongs_to :user
  has_attached_file :image 
  has_attached_file :resource
end
