class CreateStakeholders < ActiveRecord::Migration[5.1]
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.integer :created_by_user_id
      t.integer :proposal_id
      t.integer :step_id
      t.integer :user_id

      t.timestamps
    end
  end
end
