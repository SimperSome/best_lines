require "rails_helper"

RSpec.describe BookResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "books",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BookResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Book.count }.by(1)
    end
  end

  describe "updating" do
    let!(:book) { create(:book) }

    let(:payload) do
      {
        data: {
          id: book.id.to_s,
          type: "books",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BookResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { book.reload.updated_at }
      # .and change { book.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:book) { create(:book) }

    let(:instance) do
      BookResource.find(id: book.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Book.count }.by(-1)
    end
  end
end
