# == Schema Information
#
# Table name: proposals
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  status      :string
#  owner_id    :integer
#  state       :string
#  zipcode     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city        :string
#

class Proposal < ApplicationRecord

has_many :steps, :dependent => :destroy
has_many :comments, :dependent => :destroy
has_many :followers, :dependent => :destroy
belongs_to :owner, class_name: :User

def needs_volunteer
  steps = self.steps
  needy_steps = steps.where(:volunteer_id => nil)
  if needy_steps.count == 0
    return "No"
  else
    return "Yes"
  end
end

def need_volunteers
  needy_propoal_ids = Step.where(:volunteer_id => nil).distinct.pluck(:proposal_id)
  needy_proposals = Proposal.where(:id => needy_propoal_ids).distinct
  return needy_proposals
end

def count_followers
  return Follower.where(:proposal_id => self.id).count
end

end
