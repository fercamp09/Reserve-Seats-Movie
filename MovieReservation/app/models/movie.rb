class Movie < ActiveRecord::Base
  has_many :screenings
end
