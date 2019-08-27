class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.integer :proposal_id
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
