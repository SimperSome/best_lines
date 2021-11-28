require 'rails_helper'

RSpec.describe Author, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:books) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
