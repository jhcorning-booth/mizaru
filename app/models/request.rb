# == Schema Information
#
# Table name: requests
#
#  id                        :integer          not null, primary key
#  request_amount            :float
#  request_city              :string
#  request_comments          :string
#  request_country           :string
#  request_date              :date
#  request_end_time          :time
#  request_gender_preference :string
#  request_location          :string
#  request_meeting_location  :string
#  request_parking_location  :string
#  request_pet               :boolean
#  request_postal_code       :integer
#  request_start_time        :time
#  request_state             :string
#  request_status            :string
#  request_street_address    :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  provider_id               :integer
#  requestor_id              :integer
#
class Request < ApplicationRecord

  belongs_to(:requestor, { :required => true, :class_name => "User", :foreign_key => "requestor_id" })
  belongs_to(:provider, { :required => false, :class_name => "User", :foreign_key => "provider_id" })
  
end
