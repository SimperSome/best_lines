require 'rails_helper'

RSpec.describe BestLineResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'best_lines',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BestLineResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BestLine.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:best_line) { create(:best_line) }

    let(:payload) do
      {
        data: {
          id: best_line.id.to_s,
          type: 'best_lines',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BestLineResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { best_line.reload.updated_at }
      # .and change { best_line.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:best_line) { create(:best_line) }

    let(:instance) do
      BestLineResource.find(id: best_line.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BestLine.count }.by(-1)
    end
  end
end
