class AddInquiryCountToHousingListings < ActiveRecord::Migration[5.1]
  def change
    add_column :housing_listings, :inquiries_count, :integer
  end
end
