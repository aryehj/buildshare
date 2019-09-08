class DropTableStakeholders < ActiveRecord::Migration[6.0]
  def change
    drop_table :stakeholders
  end
end
