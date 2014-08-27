class CommentsController < ApplicationController
  before_action :find_parent

	def index
		find_post_id
		@comments = @post.comments.all
	end

  def new
  	find_post_id
  	@comments = @post.comments.new
  end

  def create
  	new_comment = params.require(:comment).permit(:content)
    @parent.comments.create(new_comment)
    # @comment = Comment.create(new_comment)
    # @post.comments << @comment
    @user = @post.user_id
    # redirect_to '/users/1/posts/+ #{@post}'
    # redirect_to [@user, @post]
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

  def find_parent
      @parent = @post = Post.find_by_id(params[:post_id])
      if params[:id]
        @parent = Comment.find_by_id(params[:id])
      end
      redirect_to users_path unless @parent
    end

  def find_post_id
  	post_id = params[:post_id]
  	@post = Post.find(post_id)
  end

  def find_comment_id
  	comment_id = params[:id]
  	@comment = Comment.find(comment_id)
  end


end
