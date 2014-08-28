class PagesController < ApplicationController

	def index
		find_user_id
		@pages=@user.pages

	end

	def show
    find_user_id
    find_page_id

	end


	def new
		find_user_id
		@page=@user.pages.new
		if session[:user_id] != @user.id
			redirect_to login_path
		end
	end


	def create
		find_user_id
		new_page = params[:page].permit(:name, :content)
		@page= Page.create(new_page)
		@user.pages << @page
		redirect_to login_path if session[:user_id] != @user.id
		redirect_to user_pages_url, notice: "Created page!"
	end

	def edit
		find_user_id
		find_page_id
		redirect_to login_path if session[:user_id] != @user.id
	end

	def update
		find_user_id
		find_page_id
		page_params = params.require(:page).permit(:name, :content)
			if @page.update(page_params)
				redirect_to user_page_url, :notice => "Updated the page"
			else
				render action: 'edit'
			end
	end

	def destroy
		find_user_id
		find_page_id
		@page.destroy
		redirect_to user_pages_url, :notice => "Page Deleted"

	end

	 private

	  def find_user_id
	    user_id = params[:user_id]
	    @user = User.find(user_id)
	  end

	  def find_page_id
	  	@page = @user.pages.find(params[:id])
	  end

end
