require "rails_helper"

RSpec.describe Author, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should have_many(:bibliography) }
  end

  describe "InDirect Associations" do
    it { should have_many(:best_writing) }
  end

  describe "Validations" do
  end
end
