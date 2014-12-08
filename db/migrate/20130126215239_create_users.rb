class CreateUsers < ActiveRecord::Migration
	def connection
        	ActiveRecord::Base.establish_connection(PRIMARY_DB_CONFIG).connection
					ActiveRecord::Base.establish_connection(SECONDARY_DB_CONFIG).connection
     end
	
  def change
    create_table :users do |t|
      t.string :email
      t.string :referral_code
      t.integer :referrer_id

      t.timestamps
    end
  end
end
