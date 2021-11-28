require "rails_helper"

RSpec.describe "authors#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/authors/#{author.id}"
  end

  describe "basic destroy" do
    let!(:author) { create(:author) }

    it "updates the resource" do
      expect(AuthorResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Author.count }.by(-1)
      expect { author.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
