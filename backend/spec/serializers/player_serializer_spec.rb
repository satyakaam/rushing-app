require 'rails_helper'

RSpec.describe PlayerSerializer do
  subject(:serializer) { described_class.new(player, { include: [:team] }) }

  let(:player) { create(:player) }
  let(:team) { player.team }

  describe '#serializable_hash' do
    subject(:serializable_hash) { serializer.serializable_hash }

    let(:expected_attributes) do
      Hash[
        id: player.id.to_s,
        type: :player,
        attributes: {
          name: player.name,
          postion: player.postion,
          team: player.team.abbreviation,
          attempts_per_game_average: player.attempts_per_game_average,
          attempts: player.attempts,
          total_yards: player.total_yards,
          average_yards_per_attempt: player.average_yards_per_attempt,
          yards_per_game: player.yards_per_game,
          total_touchdowns: player.total_touchdowns,
          longest_rush: player.longest_rush_details,
          first_down: player.first_down,
          first_down_pct: player.first_down_pct,
          twenty_yards_each: player.twenty_yards_each,
          fourty_yards_each: player.fourty_yards_each,
          fumbles: player.fumbles
        }
      ]
    end
    let(:expected_team_attributes) do
      Hash[
        id: team.id.to_s,
        type: :team,
        attributes: {
          abbreviation: team.abbreviation
        }
      ]
    end

    it 'includes player attributes and relationships' do
      expect(serializable_hash[:data]).to include(expected_attributes) 
    end

    it 'includes player team details' do
      expect(serializable_hash[:included]).to include(expected_team_attributes)
    end
  end
end
