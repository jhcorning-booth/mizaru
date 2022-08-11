# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  password_digest      :string
#  user_city            :string
#  user_comments        :string
#  user_country         :string
#  user_first_name      :string
#  user_last_name       :string
#  user_postal_code     :integer
#  user_profile_picture :string
#  user_race            :string
#  user_state           :string
#  user_street_address  :string
#  user_type            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:requests, { :class_name => "Request", :foreign_key => "requestor_id", :dependent => :destroy })
  has_many(:accepted_requests, { :class_name => "Request", :foreign_key => "provider_id", :dependent => :destroy })
  
end
