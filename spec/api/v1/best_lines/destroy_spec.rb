require 'rails_helper'

RSpec.describe "best_lines#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/best_lines/#{best_line.id}"
  end

  describe 'basic destroy' do
    let!(:best_line) { create(:best_line) }

    it 'updates the resource' do
      expect(BestLineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BestLine.count }.by(-1)
      expect { best_line.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
