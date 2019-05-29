class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :sublessor_id
      t.integer :sublessee_id
      t.string :payment_method
      t.integer :housing_id
      t.string :booking_details

      t.timestamps
    end
  end
end
