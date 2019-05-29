require 'rails_helper'

RSpec.describe HousingListing, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sublessor) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
