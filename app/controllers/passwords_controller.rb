class PasswordsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email(params[:email])

  	if user
  		user.set_password_reset
  		UserMailer.password_reset(user).deliver
	  	p "The email to reset password is: #{user}"
  		redirect_to root_url , notice: "Email was sent with instructions"
  	else
  		redirect_to new_password_url, notice: "Invalid Email"
	  end
	end

	def edit
		@user = User.find_by_code(params[:id])
		@password = User.find_by_code(params[:id])
	end

	def update		
		@user = User.find_by_code(params[:id])

		if @user
      update_password = params.require(:user).permit(:password)
      @user.update_attributes(:password => update_password[:password])
			p "PASSWORD UPDATED"
			redirect_to '/'
		end
	end

end
