require "rails_helper"

RSpec.describe "books#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/books", params: params
  end

  describe "basic fetch" do
    let!(:book1) { create(:book) }
    let!(:book2) { create(:book) }

    it "works" do
      expect(BookResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["books"])
      expect(d.map(&:id)).to match_array([book1.id, book2.id])
    end
  end
end
