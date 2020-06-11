FactoryBot.define do
  factory :player do
    name { "Player Name" }
    postion { "RB" }
    attempts_per_game_average { 31 }
    attempts { 5.2 }
    total_yards { 114 }
    average_yards_per_attempt { 3.7 }
    yards_per_game { 19 }
    total_touchdowns { 1 }
    longest_rush { 42 }
    longest_rush_touchdown_occurred { true }
    first_down { 5 }
    first_down_pct { 16.1 }
    twenty_yards_each { 1 }
    fourty_yards_each { 1 }
    fumbles { 0 }
    association :team
  end
end
