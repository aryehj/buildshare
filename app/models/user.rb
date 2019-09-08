# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  profile_photo   :string
#  city            :string
#  state           :string
#  zipcode         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#  email           :string
#  password_digest :string
#

class User < ApplicationRecord

has_secure_password

has_many :comments, :dependent => :nullify
has_many :proposals, :foreign_key => "owned_by_user_id", :dependent => :nullify

validates(:email,
  {
    :presence => true,
    :uniqueness => true
  }
)

def nearby
  user_zip = self.zipcode[0..4].to_i
  nearby_zips = Array.new
  nearby_zips.push(user_zip)
  1.upto(20) do |add_zips|
    nearby_zips.push(user_zip + add_zips)
    nearby_zips.push(user_zip - add_zips)
  end
  return nearby_zips
end

def following(proposal_id)
  all_follows = Follower.where(:user_id => self.id)
  if all_follows.where(:proposal_id => proposal_id).exists?
    return true
  else
    return false
  end
end

end
