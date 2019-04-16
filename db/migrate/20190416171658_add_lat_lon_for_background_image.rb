class AddLatLonForBackgroundImage < ActiveRecord::Migration[5.2]
  def change
    add_column :background_images, :lat, :float
    add_column :background_images, :lon, :float
  end
end
