class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts
  end

  def show
    user_id = params[:user_id]
    @user = User.find(user_id)
    post_id = params[:id]
    @post = @user.posts.find(params[:id])
  end



  def new
  	find_user_id
  	@posts = @user.posts.new
  end

  def create
    find_user_id
    new_post = params[:post].permit(:title, :body)
    @post = find_user_id.posts.create(new_post)

    new_tag = params[:tags].split(",").map(&:strip).map(&:downcase)
    new_tag.each do |tag_str|
      tag = Tag.find_by_name(tag_str)
      if tag == nil
        tag = Tag.create(:name => tag_str)
      end
      # Need to fix this part?  A tag belongs to many Posts?  Still working
      # new_post.tags << new_tag
    end

    redirect_to find_user_id
  end


  def edit
   find_post_id
   find_user_id
  end

  def update
    find_user_id
    find_post_id

    new_post = params.require(:post).permit(:title, :body)
    @post.update_attributes(new_post)

    new_tag = params.require(:tag).permit(:name)
    @post.tags << new_tag

    redirect_to '/'
  end


  def destroy
    post_id = params[:id]
    post = Post.find(post_id)
    post.destroy
    redirect_to '/'
  end



  private

  def find_user_id
    user_id = params[:user_id]
    @user = User.find(user_id)
  end

  def find_post_id
    post_id = params[:id]
    @post = Post.find(post_id)    
  end

end
