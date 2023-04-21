class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    respond_to do |format|
      format.json { render json: @comments }
    end
  end
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  before_action :authenticate_user!, only: [:create]
  def create
    @user = current_user
  @post = Post.find(params[:post_id])
  @comment = Comment.new(author_id: @user.id, text: params[:comment][:text], post_id: @post.id) # assign post_id
  respond_to do |format|
    if @comment.save # check if the comment is saved successfully
      flash[:success] = 'Comment was successfully created.'
      format.html { redirect_to "/users/#{@user.id}/posts/#{@post.id}" }
      format.json { render json: @comment, status: :created }
    else
      flash[:error] = 'Something went wrong.'
      render :new # render the new template again with error messages
      format.json { render json: { error: 'Error: Comment could not be saved' }, status: :unprocessable_entity }
    end
  end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    respond_to do |format|
      if comment.destroy
        # Successfully deleted the record
        flash[:success] = 'Comment deleted successfully'
        post.decrement!(:comments_counter)
      else
        # Failed to delete the record
        flash.now[:error] = 'Error: Comment could not be deleted'
      end
      format.html { redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}" }
    end
  end
end