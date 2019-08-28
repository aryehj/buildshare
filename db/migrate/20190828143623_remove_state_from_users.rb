class RemoveStateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :state_string, :string
  end
end
