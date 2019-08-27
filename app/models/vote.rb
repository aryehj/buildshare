# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  proposal_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Vote < ApplicationRecord

	belongs_to :proposal
	belongs_to :user

end
