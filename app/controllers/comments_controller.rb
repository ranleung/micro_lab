class CommentsController < ApplicationController

	def index
		find_post_id
		@comments = @post.comments.all
	end

  def new
  	find_post_id
  	@comments = @post.comments.new
  end

  def create
  	find_post_id
  	new_comment = params.require(:comment).permit(:content)
    @comment = Comment.create(new_comment)
    @post.comments << @comment
    redirect_to '/'
  end

  def show
  end

  def destroy
  	find_comment_id
  	@comment.destroy
  	find_post_id
  	redirect_to 'posts/@post'
  end


  private

  def find_post_id
  	post_id = params[:post_id]
  	@post = Post.find(post_id)
  end

  def find_comment_id
  	comment_id = params[:id]
  	@comment = Comment.find(comment_id)
  end


end
