class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = Post.where(user_id: params[:id])
  end

  def edit
    if User.find(params[:id]).id == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.id == current_user.id
      if @user.update_attributes(user_params)
        redirect_to root_url
      else
        flash[:error] = "An unexpected error occurred."
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :photo)
    end
end
