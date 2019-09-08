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
belongs_to :volunteer, class_name: :User

end
