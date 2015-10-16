class CreateRoomsTable < ActiveRecord::Migration
	def change
		create_table :rooms do |t|
			t.string :room_name
			t.string :room_description
		end	
	end	
end