class Player < ApplicationRecord
    validates :slug, presence: true, uniqueness: true
end
