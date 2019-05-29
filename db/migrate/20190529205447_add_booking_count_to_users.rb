class AddBookingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bookings_count, :integer
  end
end
