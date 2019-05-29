class HousingListing < ApplicationRecord
  # Direct associations

  belongs_to :sublessor,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
