class TimeslotsController < ApplicationController
  before_action :set_location

  def show
    @timeslots = Timeslot.where(location_id: @location.id)
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end
  
end
