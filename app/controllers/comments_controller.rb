class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:danger] = "Comment not posted"
      redirect_to post_path(@post)
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end