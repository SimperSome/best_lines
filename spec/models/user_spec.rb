require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:favorite_lines) }
  end

  describe "InDirect Associations" do
    it { should have_many(:categories) }

    it { should have_many(:favorites) }
  end

  describe "Validations" do
  end
end
