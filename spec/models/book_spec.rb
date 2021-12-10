require "rails_helper"

RSpec.describe Book, type: :model do
  describe "Direct Associations" do
    it { should have_many(:best_lines) }

    it { should belong_to(:author) }
  end

  describe "InDirect Associations" do
    it { should have_many(:tastes) }
  end

  describe "Validations" do
  end
end
