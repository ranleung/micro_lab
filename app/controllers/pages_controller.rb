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
	end


	def create
		find_user_id
		new_page = params[:page].permit(:name, :content)
		@page= Page.create(new_page)
		@user.pages << @page
		redirect_to "/"

	end

	def edit
		find_user_id
		find_page_id
	end

	def update
		find_user_id
		find_page_id
		page_params = params.require(:page).permit(:name, :content)
			if @page.update(page_params)
				redirect_to [@user, @page]
			else
				render action: 'edit'
			end
	end

	def destroy
		find_user_id
		find_page_id
		@page.destroy
		redirect_to "/"

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
