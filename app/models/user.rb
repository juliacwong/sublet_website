class User < ApplicationRecord
  # Direct associations

  has_many   :housing_listings,
             :foreign_key => "sublessor_id",
             :dependent => :destroy

  has_many   :photos,
             :class_name => "HousingPhoto",
             :foreign_key => "photo_owner_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
