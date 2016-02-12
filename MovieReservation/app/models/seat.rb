class Seat < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  has_many :screenings, through: :reservations
end
