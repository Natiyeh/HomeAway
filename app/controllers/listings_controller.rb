class ListingsController < ApplicationController
  def index
    @homes = current_user.homes
  end
end
