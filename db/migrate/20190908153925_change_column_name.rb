class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :proposals, :owned_by_user_id, :owner_id
    rename_column :steps, :volunteer_user_id, :volunteer_id
  end
end
