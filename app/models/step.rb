# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  proposal_id :integer
#  name        :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ApplicationRecord
end
