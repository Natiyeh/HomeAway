class HomesController < ApplicationController
  before_action :set_home, only: %i[show edit update destroy]

  def index
    @homes = Home.all.where.not(user_id: current_user)
    @homes = Home.where.not(latitude: nil, longitude: nil)
    @markers = @homes.map do |home|
      {
        lat: home.latitude,
        lng: home.longitude,
        infoWindow: { content: render_to_string(partial: "/homes/info_window", locals: { home: home }) }
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @home.latitude,
      lng: @home.longitude,
      infoWindow: { content: render_to_string(partial: "/homes/info_window", locals: { home: @home }) }
    }]
  end

  def new
    @home = Home.new
    @home.user = current_user
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      redirect_to home_path(@home)
    else
      @home = Home.new(home_params)
      redirect_to new_home_path
    end
  end

  def edit
  end

  def update
    @home.update(home_params)

    redirect_to home_path(@home)
  end

  def destroy
    @home.destroy

    redirect_to user_path(@home.user_id)
  end

  private

  def home_params
    params.require(:home).permit(:name, :address, :photo, :home_type, :guest, :bedroom, :bed, :bath, :rate, :description)
  end

  def set_home
    @home = Home.find(params[:id])
  end
end
