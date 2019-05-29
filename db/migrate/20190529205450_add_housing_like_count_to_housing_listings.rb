class AddHousingLikeCountToHousingListings < ActiveRecord::Migration[5.1]
  def change
    add_column :housing_listings, :housing_likes_count, :integer
  end
end
