class AddColumnToScreening < ActiveRecord::Migration
  def change
    add_column :screenings, :room_id, :integer
  end
end
