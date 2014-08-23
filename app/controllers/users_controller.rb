class UsersController < ApplicationController

	def index
		@users=User.all
		@posts= Post.all
	end

	def new
		@user = User.new
	end

	def create
		new_user = params[:user].permit(:first_name, :last_name, :email, :image_url)
		user= User.create(new_user)
		redirect_to "/"
	end


end
