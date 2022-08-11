class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_type
      t.string :user_profile_picture
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_street_address
      t.string :user_city
      t.string :user_state
      t.string :user_country
      t.integer :user_postal_code
      t.string :user_race
      t.string :user_comments

      t.timestamps
    end
  end
end
