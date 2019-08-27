class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :profile_photo

      t.timestamps
    end
  end
end
