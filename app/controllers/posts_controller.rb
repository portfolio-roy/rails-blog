class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :author).where(author_id: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(author_id: @user, title: params[:post][:title], text: params[:post][:text])
    @post.author_id = @user.id
    @post.save
    redirect_to user_posts_path(@user)
  end

  def destroy
    post = Post.find(params[:id])
    Post.find(params[:id]).comments.destroy_all
    Post.find(params[:id]).likes.destroy_all
    user = post.author
    respond_to do |format|
      if post.destroy
        user.decrement!(:posts_counter)
        # Successfully deleted the record
        flash[:success] = 'Post deleted successfully'
        format.html { redirect_to "/users/#{current_user.id}/posts" }
      else
        # Failed to delete the record
        flash.now[:error] = 'Error: Post could not be deleted'
        format.html { render :show }
      end
    end
  end
end
