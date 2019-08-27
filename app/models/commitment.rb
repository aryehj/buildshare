# == Schema Information
#
# Table name: commitments
#
#  id          :integer          not null, primary key
#  proposal_id :integer
#  step_id     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Commitment < ApplicationRecord
end
