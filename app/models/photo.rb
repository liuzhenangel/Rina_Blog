class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  scope :photo_album, -> { where(photo_type: true) }

  def image_name
    image.file.filename
  end
end
