# == Schema Information
#
# Table name: steps
#
#  id                :integer          not null, primary key
#  proposal_id       :integer
#  name              :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  volunteer_user_id :integer
#

class Step < ApplicationRecord

belongs_to :proposal, :foreign_key => "proposal_id"
has_one :volunteer, class_name: "User", :foreign_key => "volunteer_user_id"

def owner
  return User.where(:id => self.volunteer_user_id).first.name
end

end
