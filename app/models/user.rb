class User < ApplicationRecord
    has_many :events
    has_many :artists, through: :events
end
