require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:housing) }

    it { should belong_to(:sublessee) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
