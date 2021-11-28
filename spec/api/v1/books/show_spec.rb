require 'rails_helper'

RSpec.describe "books#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/books/#{book.id}", params: params
  end

  describe 'basic fetch' do
    let!(:book) { create(:book) }

    it 'works' do
      expect(BookResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('books')
      expect(d.id).to eq(book.id)
    end
  end
end
