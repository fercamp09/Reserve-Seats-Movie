class User < ActiveRecord::Base
  has_many :reservations
  has_many :seats, through: :reservations
  has_many :screenings, through: :reservations
end
