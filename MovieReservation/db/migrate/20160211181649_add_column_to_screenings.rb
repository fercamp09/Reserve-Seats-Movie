class AddColumnToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :movie_id, :integer
  end
end
