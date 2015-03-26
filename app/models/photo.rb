class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
