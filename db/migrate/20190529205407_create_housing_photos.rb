class CreateHousingPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :housing_photos do |t|
      t.string :photo_caption
      t.integer :photo_owner_id
      t.integer :housing_id

      t.timestamps
    end
  end
end
