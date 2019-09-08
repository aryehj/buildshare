# == Schema Information
#
# Table name: steps
#
#  id           :integer          not null, primary key
#  proposal_id  :integer
#  name         :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  volunteer_id :integer
#

class Step < ApplicationRecord

belongs_to :proposal
belongs_to :volunteer_user, class_name: :User

def owner
  return User.where(:id => self.volunteer_user_id).first.name
end

end
