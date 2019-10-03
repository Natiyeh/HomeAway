class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @home = Home.find(params[:home_id])
    @booking = Booking.new(booking_params)
    @booking.home = @home
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      redirect_to home_path(@home)
    end
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
