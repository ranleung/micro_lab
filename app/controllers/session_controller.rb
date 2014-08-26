class SessionController < ApplicationController
  def new
  	#Log In
  end

  def create
  	#where authentication happens
  	@user = User.authenticate(params[:user][:email],params[:user][:password])

  	if @user
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		redirect_to login_path
  	end

  end

  def destroy
  end
end
