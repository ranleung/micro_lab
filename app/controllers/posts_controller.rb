class PostsController < ApplicationController
  # def index
  # 	@posts=Post.all
  # end


  def new
  	find_user_id
  	@posts = @user.posts.new
  end

  def create
    find_user_id

  end


  def edit
  end


  def destroy
  end





  private

  def find_user_id
    user_id = params[:user_id]
    @user = User.find(user_id)
  end


end
