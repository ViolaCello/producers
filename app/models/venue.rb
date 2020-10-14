class Venue < ApplicationRecord
    has_many :events
    has_many :users, through: :events


def location
    city = self.city
    state = self.state
    location = city + ", " + state
end



end
