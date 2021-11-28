require "rails_helper"

RSpec.describe "best_lines#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/best_lines/#{best_line.id}", payload
  end

  describe "basic update" do
    let!(:best_line) { create(:best_line) }

    let(:payload) do
      {
        data: {
          id: best_line.id.to_s,
          type: "best_lines",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BestLineResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { best_line.reload.attributes }
    end
  end
end
