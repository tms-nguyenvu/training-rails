class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post


  def show
    @post = Post.find(params[:id])
    @editing_comment_id = params[:editing_comment_id]  
    @comments = @post.comments.includes(:user)
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.user != current_user
      redirect_to post_path(@post), alert: "You are not authorized to edit this comment"
      return
    end

    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "Comment has been updated"
    else
      redirect_to post_path(@post, editing_comment_id: @comment.id), alert: "Failed to update comment"
    end
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment has been created'
    else
      redirect_to post_path(@post), alert: 'Comment has not been created'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
