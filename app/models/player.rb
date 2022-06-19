class Player < ApplicationRecord
    validates :slug, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: true
end
