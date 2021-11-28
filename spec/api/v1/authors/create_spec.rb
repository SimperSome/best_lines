require "rails_helper"

RSpec.describe "authors#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/authors", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "authors",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(AuthorResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Author.count }.by(1)
    end
  end
end
