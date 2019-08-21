class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = Post.where(user_id: current_user.id).order("created_at DESC")
    @likes = Like.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params) if user.id == current_user.id
    redirect_to user_path
  end

  private
    def user_params
      params.permit(:name, :profile, :spot, :favorite, :email, :icon)
    end

end