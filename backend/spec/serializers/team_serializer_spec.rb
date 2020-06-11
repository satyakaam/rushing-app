require 'rails_helper'

RSpec.describe TeamSerializer do
  subject(:serializer) { described_class.new(team) }

  let(:team) { create(:team) }

  describe '#serializable_hash' do
    subject(:serializable_hash) { serializer.serializable_hash }

    let(:expected_attributes) do
      Hash[
        id: team.id.to_s,
        type: :team,
        attributes: {
          abbreviation: team.abbreviation
        }
      ]
    end

    it 'includes team attributes' do
      expect(serializable_hash[:data]).to include(expected_attributes) 
    end
  end
end
