require "rails_helper"

RSpec.describe "authors#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/authors/#{author.id}", payload
  end

  describe "basic update" do
    let!(:author) { create(:author) }

    let(:payload) do
      {
        data: {
          id: author.id.to_s,
          type: "authors",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AuthorResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { author.reload.attributes }
    end
  end
end
