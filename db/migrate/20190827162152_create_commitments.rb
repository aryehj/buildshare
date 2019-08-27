class CreateCommitments < ActiveRecord::Migration[5.1]
  def change
    create_table :commitments do |t|
      t.integer :proposal_id
      t.integer :step_id
      t.integer :user_id

      t.timestamps
    end
  end
end
