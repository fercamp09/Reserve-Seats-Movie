class AddColumnToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :screening_id, :integer
  end
end
