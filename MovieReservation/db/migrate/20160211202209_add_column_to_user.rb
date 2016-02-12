class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :espol, :string
  end
end
