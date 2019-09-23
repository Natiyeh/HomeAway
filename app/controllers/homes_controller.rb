class HomesController < ApplicationController
  before_action :set_home, only: %i[show edit update destroy]

  def index
    @homes = Home.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.user = current_user
    if @home.save
      redirect_to home_path(@home)
    else
      @home = Home.new(home_params)
      redirect_to homes_path
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

    redirect_to homes_path
  end

  private

  def home_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:home).permit(:name, :address)
  end

  def set_home
    @home = Home.find(params[:id])
  end
end
