class SessionController < ApplicationController
  def new
  	#Log In
  end

  def create
  	#where authentication happens
  	@user = User.authenticate(params[:user][:email],params[:user][:password])

  	if @user
  		session[:user_id] = @user.id
  		p "LOGGED IN"
  		redirect_to root_path
  	else
  		p "DID NOT LOG IN"
  		redirect_to login_path
  	end

  end

  def destroy
  	session[:user_id] = nil
  	p "SESSION DESTROYED - LOGGED OUT"
  	redirect_to login_path
  end
end
