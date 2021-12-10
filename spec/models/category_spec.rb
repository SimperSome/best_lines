require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should have_many(:best_lines) }
  end

  describe "InDirect Associations" do
    it { should have_many(:books) }

    it { should have_many(:authors) }
  end

  describe "Validations" do
  end
end
