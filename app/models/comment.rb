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
end
