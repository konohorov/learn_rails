class Team < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
end