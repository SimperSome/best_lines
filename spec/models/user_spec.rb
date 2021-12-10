require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:favorite_lines) }

    it { should have_many(:reading_list) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
