class Photo < ApplicationRecord
  belongs_to :product, inverse_of: :photo

  mount_uploader :image, ImageUploader
end
