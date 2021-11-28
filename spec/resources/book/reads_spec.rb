require 'rails_helper'

RSpec.describe BookResource, type: :resource do
  describe 'serialization' do
    let!(:book) { create(:book) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(book.id)
      expect(data.jsonapi_type).to eq('books')
    end
  end

  describe 'filtering' do
    let!(:book1) { create(:book) }
    let!(:book2) { create(:book) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: book2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([book2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:book1) { create(:book) }
      let!(:book2) { create(:book) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            book1.id,
            book2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            book2.id,
            book1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
