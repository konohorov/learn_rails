class Team < ApplicationRecord
  has_many :players

  validates :slug, presence: true, uniqueness: true
end
