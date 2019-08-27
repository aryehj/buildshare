class AddLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location_string, :string
  end
end
