# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  profile_photo :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
end
