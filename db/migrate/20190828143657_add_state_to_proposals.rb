class AddStateToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :state, :string
  end
end
