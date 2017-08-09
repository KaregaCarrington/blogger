class CommentsController < ApplicationController
  before_action :find_post, :find_comment

  def create
    @comment = @post.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to post_path(id: @post.uuid)
    else
      flash[:danger] = "Comment not posted"
      redirect_to post_path(@post)
    end
  end


  def destroy
    @comment = Comment.find_by(params[:uuid])
    @comment.destroy
    redirect_to post_path(id: @post.uuid)
  end

  private

  def find_comment
    @comment = Comment.find_by(uuid: params[:id])
  end

  def find_post
    @post = Post.find_by(uuid: params[:id])
  end

end
