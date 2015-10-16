class CreateProfilesTable < ActiveRecord::Migration
	def change
		create_table :profiles do |t|
			t.integer :user_id
			t.string :profile_headline
			t.string :profile_content
		end	
	end	
end