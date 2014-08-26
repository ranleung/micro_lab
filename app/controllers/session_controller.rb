class SessionController < ApplicationController


  def new
  end

  def create
  	@user= User.authenticate(params[:user][:email],params[:user][:password])

  	if @user
  		session[:user_id]=@user.id
  		redirect_to root_path
  	else
  		render text: "login fail"
  	end
  end

  def destroy
  end
end
