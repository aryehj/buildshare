# == Schema Information
#
# Table name: followers
#
#  id          :integer          not null, primary key
#  proposal_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Follower < ApplicationRecord

belongs_to :proposal, :foreign_key => "proposal_id"
belongs_to :user, :foreign_key => "user_id"

end
