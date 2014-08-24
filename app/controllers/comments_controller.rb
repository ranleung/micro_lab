class CommentsController < ApplicationController
  
  def new
  	find_post_id
  	@comments = @post.comments.new
  end

  def create
  	find_post_id
  end

  def show
  end

  private

  def find_post_id
  	post_id = params[:id]
  	@post = Post.find(post_id) 
  end


end
