class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.text :name
      t.text :description
      t.string :status
      t.integer :owned_by_user_id
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
