class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @post
    else
      puts "hello"
      flash.now[:danger] = "error"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:description, :post_id)
    end
end
