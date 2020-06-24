class RenameImageIdColumnToPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :image_id, :image
  end
end
