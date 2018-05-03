class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)

    @comment.user_attributes=(comment_params)
=begin
    if !params[:comment][:user][:attributes][:username].empty?
      @user = User.create(username: params[:comment][:user][:attributes][:username])
      @user.comments << @comment
    end
=end
    @post = Post.find(params[:post_id])
    @post.comments << @comment
    @post.save
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
