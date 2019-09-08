# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comment     :text
#  user_id     :integer
#  proposal_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord

belongs_to :proposal, :foreign_key => "proposal_id"
belongs_to :user, :foreign_key => "user_id"

end
