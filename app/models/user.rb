class User < ApplicationRecord
    has_many :events
    has_many :artists, through: :events
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :company, presence: true, uniqueness: true
end
