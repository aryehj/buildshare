class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.string :proposal_id
      t.string :user_id

      t.timestamps
    end
  end
end
