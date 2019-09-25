class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
