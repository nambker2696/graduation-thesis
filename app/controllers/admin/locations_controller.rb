class Admin::LocationsController < Admin::BaseController
  before_action :set_admin_location, only: [:show, :edit, :update, :destroy]

  # GET /admin_locations
  # GET /admin_locations.json
  def index
    @admin_locations = Location.all
    @openinghours = OpeningHour.all
    # @admin_locations = Location.joins(:store).where("stores.id" => 1)
    # @openinghours =  OpeningHour.joins(:location).joins(:store).where("stores.id=?",store.id)
  end
  # GET /admin_locations/1
  # GET /admin_locations/1.json
  def show
  end

  # GET /admin_locations/new
  def new
    @admin_location = Location.new
  end

  # GET /admin_locations/1/edit
  def edit
  end

  # POST /admin_locations
  # POST /admin_locations.json
  def create
    @admin_location = Location.new(admin_location_params)

    respond_to do |format|
      if @admin_location.save
        format.html { redirect_to admin_locations_url, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, admin_location: @admin_location }
      else
        format.html { render :new }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_locations/1
  # PATCH/PUT /admin_locations/1.json
  def update
    respond_to do |format|
      if @admin_location.update(admin_location_params)
        format.html { redirect_to admin_locations_url, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, admin_location: @admin_location }
      else
        format.html { render :edit }
        format.json { render json: @admin_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_locations/1
  # DELETE /admin_locations/1.json
  def destroy
    @admin_location.destroy
    respond_to do |format|
      format.html { redirect_to admin_locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_location
      @admin_location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_location_params
      params.require(:location).permit(:store_id, :name,:user_id, :address, :phone,:open_time, :status,:description, :radius,:sum_rate,:rate_avg)
    end
end
