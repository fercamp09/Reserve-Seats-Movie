class Room < ActiveRecord::Base
  has_many :seats
  has_many :screenings
end
