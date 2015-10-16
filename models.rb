class User < ActiveRecord::Base
	has_one :profile
	has_many :posts
	has_many :user_rooms
	has_many :rooms, through: :user_rooms
	has_many :room_users
	has_many :users, through: :room_users
end

class Room < ActiveRecord::Base
	has_many :user_rooms
	has_many :users, through: :user_rooms
	has_many :room_users
	has_many :users, through: :room_users
	has_many :posts
end

class UserRoom < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
end

class RoomUser < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
end

class Profile < ActiveRecord::Base
	belongs_to :user
end

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
end