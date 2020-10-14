class Venue < ApplicationRecord
    has_many :events
    has_many :users, through: :events
    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :seats, presence: true



def location
    city = self.city
    state = self.state
    "#{city}, #{state}"
end



end
