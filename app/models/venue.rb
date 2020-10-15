class Venue < ApplicationRecord
    has_many :events
    has_many :users, through: :events
    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :seats, presence: true
    scope :large, -> { where 'seats > ?', 1000 }
    scope :by_state, ->(input) { where("state = ?", input) }

def location
    city = self.city
    state = self.state
    "#{city}, #{state}"
end

# def self.by_state(town)
#     self.where("state = ?", town)
# end




end
