# == Schema Information
#
# Table name: proposals
#
#  id               :integer          not null, primary key
#  name             :text
#  description      :text
#  location         :string
#  status           :string
#  owned_by_user_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Proposal < ApplicationRecord
end
