class HousingPhoto < ApplicationRecord
  # Direct associations

  belongs_to :housing,
             :class_name => "HousingListing",
             :counter_cache => true

  belongs_to :photo_owner,
             :class_name => "User",
             :counter_cache => :photos_count

  # Indirect associations

  # Validations

end
