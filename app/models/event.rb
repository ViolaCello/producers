class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :name, presence: true
end

def nicedate
  self.strftime("%b %-d, %Y")
end

def nicetime
  self.strftime("%-I:%M %P")
end