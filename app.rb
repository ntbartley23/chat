require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './environments'
enable :sessions

require './models'

get '/' do
	@my_user = User.find(1)
	erb :home
end
get '/users' do
	@users = User.all
	erb :users
end
get '/user/:id' do
	@user = User.find(params[:id])
	@profile = Profile.find_by(user_id:params[:id])
	@user_rooms = User.find(params[:id]).rooms
	erb :user
end
get '/rooms' do
	@rooms = Room.all
	erb :rooms
end
get '/room/:id' do
	@room = Room.find(params[:id])
	@room_users = Room.find(params[:id]).users
	@room_posts = Room.find(params[:id]).posts
	erb :room
end
get '/form' do
	erb :form
end
post '/signin' do
	@user = User.where(user_name: params[:user_name]).first
	if @user.password == params[:password]
		flash[:notice] = "Congratulations!"
		session[:session_user_id] = @user.id
		session[:session_user_name] = @user.user_name
		redirect '/login-success'
	else
		flash[:alert] = "Bad News!"
		redirect '/login-failed'
	end
end
get '/login-success' do
	erb :success
end
get '/login-failed' do
	erb :fail
end
get '/logout' do
	session.clear
	redirect '/'
end