require 'json'
file = File.read(Rails.root.join('db', 'rushing.json'))

players = JSON.parse(file)

players.each do |player|
  team = Team.find_or_create_by(abbreviation: player["Team"])
  longest_rush_touchdown_occurred = !!(player["Lng"] =~ /T\z/)
  team.players.create(
    name: player["Player"],
    postion: player["Pos"],
    attempts_per_game_average: player["Att/G"],
    attempts: player["Att"],
    total_yards: player["Yds"],
    average_yards_per_attempt: player["Avg"],
    yards_per_game: player["Yds/G"],
    total_touchdowns: player["TD"],
    longest_rush: longest_rush_touchdown_occurred ? player["Lng"].slice!(0) : player["Lng"],
    longest_rush_touchdown_occurred: longest_rush_touchdown_occurred,
    first_down: player["1st"],
    first_down_pct: player["1st%"],
    twenty_yards_each: player["20+"],
    fourty_yards_each: player["40+"],
    fumbles: player["FUM"]
  )
end