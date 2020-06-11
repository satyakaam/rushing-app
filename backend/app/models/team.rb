class Team < ApplicationRecord
  has_many :players

  validates :abbreviation, length: { maximum: 3 }, presence: true, uniqueness: true
end
