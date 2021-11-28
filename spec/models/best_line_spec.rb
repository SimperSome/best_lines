require "rails_helper"

RSpec.describe BestLine, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should belong_to(:book) }

    it { should belong_to(:category) }
  end

  describe "InDirect Associations" do
    it { should have_one(:author) }
  end

  describe "Validations" do
    it { should validate_presence_of(:page) }
  end
end
