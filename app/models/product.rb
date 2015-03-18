class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  has_many :comments
  has_many :likes

end
