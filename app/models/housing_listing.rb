class HousingListing < ApplicationRecord
  # Direct associations

  has_many   :housing_photos,
             :foreign_key => "housing_id",
             :dependent => :destroy

  has_many   :bookings,
             :foreign_key => "housing_id",
             :dependent => :destroy

  has_many   :inquiries,
             :foreign_key => "housing_id",
             :dependent => :destroy

  has_many   :housing_likes,
             :foreign_key => "housing_id",
             :dependent => :destroy

  belongs_to :sublessor,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
