class HousingLike < ApplicationRecord
  # Direct associations

  belongs_to :housing,
             :class_name => "HousingListing",
             :counter_cache => true

  belongs_to :sublessee,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
