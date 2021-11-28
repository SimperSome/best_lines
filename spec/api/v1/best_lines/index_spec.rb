require 'rails_helper'

RSpec.describe "best_lines#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/best_lines", params: params
  end

  describe 'basic fetch' do
    let!(:best_line1) { create(:best_line) }
    let!(:best_line2) { create(:best_line) }

    it 'works' do
      expect(BestLineResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['best_lines'])
      expect(d.map(&:id)).to match_array([best_line1.id, best_line2.id])
    end
  end
end
