class UsersController < ApplicationController

	def index
		@users=User.all
		@posts= Post.all
	end

	def new
	end

	def create
		new_user = params[:user].permit[:first_name, :last_name, :email, :image_url]
		user= User.create(new_user)
		redirect_to new_user
	
	end
end
