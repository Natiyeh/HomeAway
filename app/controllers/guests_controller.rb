class GuestsController < ApplicationController
  def index
    @upcoming_bookings = Booking.select do |booking|
    booking.home.user_id == current_user.id
    end
  end
end
