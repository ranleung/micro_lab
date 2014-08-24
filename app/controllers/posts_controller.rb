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
    new_post = params[:post].permit(:title, :body)
    @post = find_user_id.posts.create(new_post)

    new_tag = params[:tags].split(",").map(&:strip).map(&:downcase)
    new_tag.each do |tag_str|
      tag = Tag.find_by_name(tag_str)
      if tag == nil
        tag = Tag.create(:name => tag_str)
      end
      # Need to fix this part?  A tag belongs to many Posts?  Still working
      # new_post.tags << tag
    end

    redirect_to find_user_id
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
