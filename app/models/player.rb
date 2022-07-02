class Player < ApplicationRecord
  belongs_to :team, optional: true

  validates :slug, presence: true, uniqueness: true
end
