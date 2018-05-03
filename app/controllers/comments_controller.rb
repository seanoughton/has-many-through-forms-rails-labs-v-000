class CommentsController < ApplicationController

  def create
    binding.pry
    @comment = Comment.create(comment_params)
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
