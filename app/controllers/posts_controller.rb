class PostsController < ApplicationController
  # def index
  # 	@posts=Post.all
  # end

  def new
  	id = params[:user_id]
  	@user =User.find(id)
  	@posts = Post.new
  end

  def edit
  end

  def destroy
  end
end
