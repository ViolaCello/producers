class Event < ApplicationRecord
  belongs_to :user
  belongs_to :artist, optional: true
 
end
