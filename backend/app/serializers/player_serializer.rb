class PlayerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :postion, :attempts_per_game_average, :attempts, 
    :total_yards, :average_yards_per_attempt, :yards_per_game, 
    :total_touchdowns, :first_down, :first_down_pct, 
    :twenty_yards_each, :fourty_yards_each, :fumbles
  belongs_to :team

  attributes :longest_rush do |player|
    player.longest_rush_details
  end

  attributes :team do |player|
    player.team.abbreviation
  end
end
