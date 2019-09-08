# == Schema Information
#
# Table name: stakeholders
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  phone              :string
#  address            :string
#  created_by_user_id :integer
#  proposal_id        :integer
#  step_id            :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Stakeholder < ApplicationRecord

belongs_to :proposal, :foreign_key => "proposal_id"
belongs_to :user, :required => false, :foreign_key => "created_by_user_id"
belongs_to :step, :required => false, :foreign_key => "step_id"

end
