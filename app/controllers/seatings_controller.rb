class SeatingsController < ApplicationController
  before_action :set_location

  def show
    @seatings = Seating.where(location_id: @location.id)
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end
  
end
