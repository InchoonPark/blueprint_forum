class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id]).order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
    if Post.find(params[:id]).user.id == current_user.id
      @post = Post.find(params[:id])
    else
      flash[:error] = "You cannot edit a post that is not yours"
      redirect_to root_url
    end
  end

  def destroy
    if Post.find(params[:id]).user.id == current_user.id
      Post.find(params[:id]).destroy
      flash[:success] = "Post deleted"
      redirect_to root_url
    else
      flash[:error] = "You must own a post to delete it"
      redirect_to root_url
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      flash[:success] = "Post was updated!"
      redirect_to root_url
    else
      flash[:error] = "An unexpected error occurred."
      redirect_to root_url
    end
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      flash[:error] = "An unexpected error occurred."
    end
  end

  def new
    @post = Post.new
  end

  private

    def post_params
      params.require(:post).permit(:heading, :description, :photo)
    end
end
