class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.belongs_to :team
      t.string :name
      t.string :postion
      t.decimal :attempts_per_game_average, precision: 10, scale: 2
      t.integer :attempts
      t.decimal :total_yards, precision: 10, scale: 2
      t.decimal :average_yards_per_attempt, precision: 10, scale: 2
      t.string :yards_per_game, precision: 10, scale: 2
      t.integer :total_touchdowns
      t.decimal :longest_rush, precision: 10, scale: 2
      t.boolean :longest_rush_touchdown_occurred, default: false
      t.decimal :first_down, precision: 10, scale: 2
      t.decimal :first_down_pct, precision: 10, scale: 2
      t.decimal :twenty_yards_each, precision: 10, scale: 2
      t.decimal :fourty_yards_each, precision: 10, scale: 2
      t.decimal :fumbles, precision: 10, scale: 2

      t.timestamps
    end
  end
end
