class Player < ApplicationRecord
  belongs_to :team

  def longest_rush_details
    "#{longest_rush}#{'T' if longest_rush_touchdown_occurred}"
  end
end
