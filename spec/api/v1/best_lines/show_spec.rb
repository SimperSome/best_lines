require 'rails_helper'

RSpec.describe "best_lines#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/best_lines/#{best_line.id}", params: params
  end

  describe 'basic fetch' do
    let!(:best_line) { create(:best_line) }

    it 'works' do
      expect(BestLineResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('best_lines')
      expect(d.id).to eq(best_line.id)
    end
  end
end
