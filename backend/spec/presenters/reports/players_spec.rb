require 'rails_helper'

RSpec.describe Reports::Players do
  subject(:csv) { described_class.new }

  let!(:player) { create(:player) }
  let(:team) { player.team }

  describe '#flatten_data' do
    subject(:data) { csv.flatten_data() }

    let(:expected_data) do
      Hash[
        id: player.id,
        team_id: team.id,
        name: player.name,
        postion: player.postion,
        attempts_per_game_average: player.attempts_per_game_average,
        attempts: player.attempts,
        total_yards: player.total_yards,
        average_yards_per_attempt: player.average_yards_per_attempt,
        yards_per_game: player.yards_per_game,
        total_touchdowns: player.total_touchdowns,
        longest_rush: player.longest_rush_details,
        longest_rush_touchdown_occurred: player.longest_rush_touchdown_occurred,
        first_down: player.first_down,
        first_down_pct: player.first_down_pct,
        twenty_yards_each: player.twenty_yards_each,
        fourty_yards_each: player.fourty_yards_each,
        fumbles: player.fumbles,
        created_at: player.created_at,
        updated_at: player.updated_at,
        team: team.abbreviation
      ]
    end

    it { expect(data).to be_a_kind_of(Enumerator::Lazy) }

    it { expect(data.first).to eq(expected_data) }
  end

  describe '#each' do
    it 'it matches headers string' do
      expect(csv.first).to eq("Player,Team,Pos,Att,Att/G,Yds,Avg,Yds/G,TD,Lng,1st,1st%,20+,40+,FUM\n")
    end
  end
end
