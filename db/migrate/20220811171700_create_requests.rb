class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.date :request_date
      t.time :request_start_time
      t.time :request_end_time
      t.string :request_location
      t.string :request_street_address
      t.string :request_city
      t.string :request_state
      t.string :request_country
      t.integer :request_postal_code
      t.string :request_parking_location
      t.string :request_meeting_location
      t.boolean :request_pet
      t.string :request_gender_preference
      t.string :request_comments
      t.float :request_amount
      t.string :request_status
      t.integer :requestor_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
