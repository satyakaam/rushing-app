module Reports
  class Players < ::Reports::Csv
    HEADERS_MAP = {
      'Player': :name,
      'Team': :team,
      'Pos': :position,
      'Att': :attempts,
      'Att/G': :attempts_per_game_average,
      'Yds': :total_yards,
      'Avg': :average_yards_per_attempt,
      'Yds/G': :yards_per_game,
      'TD': :total_touchdowns,
      'Lng': :longest_rush,
      '1st': :first_down,
      '1st%': :first_down_pct,
      '20+': :twenty_yards_each,
      '40+': :fourty_yards_each,
      'FUM': :fumbles
    }.freeze

    def initialize(data = nil)
      super(flatten_data(data), HEADERS_MAP)
    end


    def flatten_data(data = nil)
      data ||= Player.includes(:team).find_each(batch_size: 500) if data.empty?

      data.lazy.map do |player|
        player.attributes.symbolize_keys.merge({
          longest_rush: player.longest_rush_details,
          team: player.team.abbreviation
        })
      end
    end
  end
end
