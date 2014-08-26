class PasswordsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	p "The email to reset password is: #{user}"

  	if user
  		user.set_password_reset
  		UserMailer.password_reset(user).deliver
  		redirect_to '/', notice: "Email was sent with instructions"
  	else
  		redirect_to action: 'new', :notice => "Invalid Email"
	  end
	end

	def edit
		
	end


end
