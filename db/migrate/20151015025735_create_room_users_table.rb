class CreateRoomUsersTable < ActiveRecord::Migration
	def change
		create_table :room_users do |t|
			t.integer :room_id
			t.integer :user_id
		end	
	end	
end