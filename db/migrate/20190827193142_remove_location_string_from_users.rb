class RemoveLocationStringFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :location_string, :string
  end
end
