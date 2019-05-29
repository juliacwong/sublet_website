class AddBookingCountToHousingListings < ActiveRecord::Migration[5.1]
  def change
    add_column :housing_listings, :bookings_count, :integer
  end
end
