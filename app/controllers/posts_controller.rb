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
    @comments = @post.comments.all
    @comment = @post.comments.new
  end



  def new

  	find_user_id
  	@posts = @user.posts.new
  end


  def create

    find_user_id
    if session[:user_id] == @user.id
    new_post = params[:post].permit(:title, :body)
    @post = find_user_id.posts.new(new_post)

    new_tag = params[:tags].split(",").map(&:strip).map(&:downcase)

    if @post.save 
      new_tag.each do |tag_str|
        tag = Tag.find_or_create_by(name: tag_str)
        @post.tags << tag
    end
      redirect_to [@user, @post], :notice => "Post Added!"
    else
      flash.now[:notice] = "Try again"
      render action: 'new'
    end
  else
    render plain: "DONT HACK ME!"
  end
  end


  def edit
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])

    if session[:user_id] == @user.id
      render :edit
    else
      redirect_to login_path, :notice => "Please log in first"
    end

  end


  def update

    find_user_id
    find_post_id

    if @post
      update_post = params.require(:post).permit(:title, :body)
      @post.update_attributes(:title => update_post[:title], :body => update_post[:body])
    
      # new_tag.each do |tag_str|
      #   tag = Tag.find_or_create_by(name: tag_str)
      #   @post.tags << tag
      # end

      redirect_to user_post_url, :notice => "Edited the post!!!"
    else
      redirect_to user_post_url
    end


  end


  def destroy

    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy

    redirect_to user_post_url, :notice => "Post was deleted"
  end



  private

  def find_user_id
    user_id = params[:user_id]
    @user = User.find_by_id(user_id)
  end

  def find_post_id
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

end