class Product < ApplicationRecord
  has_one :photo, inverse_of: :product

  accepts_nested_attributes_for :photo
end
