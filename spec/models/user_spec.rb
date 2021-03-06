require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookings) }

    it { should have_many(:inquiries) }

    it { should have_many(:housing_likes) }

    it { should have_many(:housing_listings) }

    it { should have_many(:photos) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
