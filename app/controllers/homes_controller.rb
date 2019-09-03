class HomesController < ApplicationController
  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.save

    redirect_to home_path(@home)
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    @home.update(home_params)

    redirect_to home_path(@home)
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    redirect_to homes_path
  end

  private

  def home_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:home).permit(:name, :address)
  end
end
