class Admin::SeatingsController < Admin::BaseController
  before_action :set_seating, only: [:show, :edit, :update, :destroy]

  # GET /seatings
  # GET /seatings.json
  def index
    @seatings = Seating.all
  end

  # GET /seatings/1
  # GET /seatings/1.json
  def show
  end

  # GET /seatings/new
  def new
    @seating = Seating.new
  end

  # GET /seatings/1/edit
  def edit
  end

  # POST /seatings
  # POST /seatings.json
  def create
    @seating = Seating.new(seating_params)

    respond_to do |format|
      if @seating.save
        format.html { redirect_to @seating, notice: 'Seating was successfully created.' }
        format.json { render :show, status: :created, location: @seating }
      else
        format.html { render :new }
        format.json { render json: @seating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seatings/1
  # PATCH/PUT /seatings/1.json
  def update
    respond_to do |format|
      if @seating.update(seating_params)
        format.html { redirect_to @seating, notice: 'Seating was successfully updated.' }
        format.json { render :show, status: :ok, location: @seating }
      else
        format.html { render :edit }
        format.json { render json: @seating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seatings/1
  # DELETE /seatings/1.json
  def destroy
    @seating.destroy
    respond_to do |format|
      format.html { redirect_to seatings_url, notice: 'Seating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seating
      @seating = Seating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seating_params
      params.require(:seating).permit(:seat_name,:location_id, :floor, :description)
    end
end
