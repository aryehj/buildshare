# == Schema Information
#
# Table name: proposals
#
#  id               :integer          not null, primary key
#  name             :text
#  description      :text
#  status           :string
#  owned_by_user_id :integer
#  state            :string
#  zipcode          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Proposal < ApplicationRecord

has_many :steps, :dependent => :destroy
has_many :comments, :dependent => :destroy
has_many :stakeholders, :dependent => :destroy
has_many :votes, :dependent => :destroy
has_many :commitments, :dependent => :destroy
belongs_to :created_by_user, :class_name => "User", :foreign_key => "owned_by_user_id"

end
