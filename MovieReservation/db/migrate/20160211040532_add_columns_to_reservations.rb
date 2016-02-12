class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :user_id, :integer
    add_column :reservations, :seat_id, :integer
  end
end
