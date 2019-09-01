class AddVolunteerUserIdToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :volunteer_user_id, :integer
  end
end
