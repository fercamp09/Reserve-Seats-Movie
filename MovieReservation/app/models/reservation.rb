class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :seat
  belongs_to :screening
end
