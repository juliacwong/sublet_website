class HousingListing < ApplicationRecord
  # Direct associations

  has_many   :housing_likes,
             :foreign_key => "housing_id",
             :dependent => :destroy

  belongs_to :sublessor,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
