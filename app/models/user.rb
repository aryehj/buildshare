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

has_one :stakeholder, :dependent => :nullify
has_many :comments, :dependent => :nullify
has_many :proposals, :foreign_key => "owned_by_user_id", :dependent => :nullify
has_many :votes, :dependent => :destroy
has_many :commitments, :dependent => :nullify
has_many :stakeholders, :foreign_key => "created_by_user_id", :dependent => :nullify

validates(:email,
  {
    :presence => true,
    :uniqueness => true
  }
)

end
