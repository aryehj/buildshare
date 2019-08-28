class AddZipToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :zipcode, :integer
  end
end
