class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :column

      t.timestamps null: false
    end
  end
end
