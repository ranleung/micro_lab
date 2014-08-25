class UsersController < ApplicationController

	def index
		@users=User.all
		@posts= Post.all
	end

	def new
		@user = User.new
	end

	def show
		id = params[:id]
		@user = User.find(id)

	end

	def create
		new_user = params[:user].permit(:first_name, :last_name, :email, :image_url)

		user= User.create(new_user)
		redirect_to action: "index"
	end


	def edit
		find_user_id
	end

	def update
		find_user_id

		user_params = params.require(:user).permit(:first_name, :last_name, :email, :image_url)
			if @user.update(user_params)
				redirect_to @user
			else
				render action: 'edit'
			end
	end

	def destroy
		find_user_id
		@user.destroy
		redirect_to "/"

	end

	private

	  def find_user_id
	    user_id = params[:id]
	    @user = User.find(user_id)
	  end





end
