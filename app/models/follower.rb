# == Schema Information
#
# Table name: followers
#
#  id          :integer          not null, primary key
#  proposal_id :string
#  user_id     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Follower < ApplicationRecord

belongs_to :proposal
belongs_to :user

end
