class RemoveLocationFromProposals < ActiveRecord::Migration[5.1]
  def change
    remove_column :proposals, :location, :string
  end
end
