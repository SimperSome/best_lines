require 'rails_helper'

RSpec.describe BestLineResource, type: :resource do
  describe 'serialization' do
    let!(:best_line) { create(:best_line) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(best_line.id)
      expect(data.jsonapi_type).to eq('best_lines')
    end
  end

  describe 'filtering' do
    let!(:best_line1) { create(:best_line) }
    let!(:best_line2) { create(:best_line) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: best_line2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([best_line2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:best_line1) { create(:best_line) }
      let!(:best_line2) { create(:best_line) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            best_line1.id,
            best_line2.id
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
            best_line2.id,
            best_line1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
