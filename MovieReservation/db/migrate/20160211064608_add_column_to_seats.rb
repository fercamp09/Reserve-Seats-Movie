class AddColumnToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :room_id, :integer
  end
end
