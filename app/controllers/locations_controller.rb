class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @openinghours = OpeningHour.all
    # @locations = Location.joins(:store).where("stores.id" => 1)
    # @openinghours =  OpeningHour.joins(:location).joins(:store).where("stores.id=?",store.id)
  end
  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])
    @store_owner = User.find(@location.id)
    @dishs = Dish.joins(:location).where("locations.id" => params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:store_id, :name,:user_id, :address, :phone, :status, :radius)
    end
end
