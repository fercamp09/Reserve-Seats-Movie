class Screening < ActiveRecord::Base
  has_many :reservations
  has_many :seats, through: :reservations
  has_many :users, through: :reservations
  belongs_to :room
  belongs_to :movie
end
