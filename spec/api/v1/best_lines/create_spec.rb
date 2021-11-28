require 'rails_helper'

RSpec.describe "best_lines#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/best_lines", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'best_lines',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BestLineResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { BestLine.count }.by(1)
    end
  end
end
