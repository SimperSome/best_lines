require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:authors) }

    it { should have_many(:categories) }

    it { should have_many(:readings) }

    it { should have_many(:favorite_lines) }
  end

  describe "InDirect Associations" do
    it { should have_many(:books) }
  end

  describe "Validations" do
    it { should validate_presence_of(:username) }
  end
end
