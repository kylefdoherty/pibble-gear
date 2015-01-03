# encoding: utf-8
class ProductImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [250, 250]
  end

  version :large do
    process resize_to_fit: [500, 500]
  end
end
