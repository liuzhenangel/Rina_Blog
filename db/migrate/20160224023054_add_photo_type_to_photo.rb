class AddPhotoTypeToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :photo_type, :boolean, :default => false
  end
end
