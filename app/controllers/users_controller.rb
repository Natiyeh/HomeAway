class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  skip_before_action :authenticate_user!, only: [:show]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to
  end

  def show
    if current_user
      @upcoming_bookings = Booking.select do |booking|
        booking.home.user_id == current_user.id
      end
      @bookings = Booking.select do |booking|
        booking.user_id == current_user.id
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :photo, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
