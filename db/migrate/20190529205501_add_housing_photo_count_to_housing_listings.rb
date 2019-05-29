class AddHousingPhotoCountToHousingListings < ActiveRecord::Migration[5.1]
  def change
    add_column :housing_listings, :housing_photos_count, :integer
  end
end
