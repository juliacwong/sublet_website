require 'rails_helper'

RSpec.describe HousingPhoto, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:housing) }

    it { should belong_to(:photo_owner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
