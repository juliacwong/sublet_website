class CreateHousingListings < ActiveRecord::Migration[5.1]
  def change
    create_table :housing_listings do |t|
      t.string :housing_type
      t.string :city
      t.string :neighborhood
      t.integer :number_of_guests
      t.float :number_of_bedrooms
      t.float :number_of_bathrooms
      t.string :state
      t.string :country
      t.string :amenities
      t.string :description
      t.string :monthly_price
      t.integer :sublessor_id
      t.datetime :available_from
      t.datetime :available_till
      t.integer :housing_photo_id
      t.integer :sublessee_id
      t.integer :zip_code

      t.timestamps
    end
  end
end
