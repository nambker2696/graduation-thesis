class LocationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_location, only: [:show]

  attr_reader :location, :dish
  attr_reader :location, :review
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
    @store_owner = User.find(@location.user_id)
    @dishes= location.dishes.order(created_at: :desc).to_a
    @reviews = location.reviews.order(created_at: :desc).to_a
    
    index_of_dish = @dishes.index @dish
    if index_of_dish && index_of_dish != 0
      @dishes.delete_at index_of_dish
      @dishes.unshift @dish
    end

    # @dishs = Dish.joins(:location).where("locations.id" => params[:id])
    # if user_signed_in?
    #   @like = Like.find_by(user_id: current_user.id, target: location)
    # else
    #   @like = Like.find_by(target: location)
    # end
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find_by id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:store_id, :name,:user_id, :address, :phone, :status, :radius,:sum_rate,:rate_avg)
    end
end
