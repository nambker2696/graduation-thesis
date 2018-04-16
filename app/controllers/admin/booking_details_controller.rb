class Admin::BookingDetailsController < Admin::BaseController
  before_action :set_booking_detail, only: [:show, :edit, :update, :destroy]

  # GET /booking_details
  # GET /booking_details.json
  def index
    @booking_details = BookingDetail.all
  end

  # GET /booking_details/1
  # GET /booking_details/1.json
  def show
  end

  # GET /booking_details/new
  def new
    @booking_detail = BookingDetail.new
  end

  # GET /booking_details/1/edit
  def edit
  end

  # POST /booking_details
  # POST /booking_details.json
  def create
    @booking_detail = BookingDetail.new(booking_detail_params)

    respond_to do |format|
      if @booking_detail.save
        format.html { redirect_to @booking_detail, notice: 'Booking detail was successfully created.' }
        format.json { render :show, status: :created, location: @booking_detail }
      else
        format.html { render :new }
        format.json { render json: @booking_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_details/1
  # PATCH/PUT /booking_details/1.json
  def update
    respond_to do |format|
      if @booking_detail.update(booking_detail_params)
        format.html { redirect_to @booking_detail, notice: 'Booking detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_detail }
      else
        format.html { render :edit }
        format.json { render json: @booking_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_details/1
  # DELETE /booking_details/1.json
  def destroy
    @booking_detail.destroy
    respond_to do |format|
      format.html { redirect_to booking_details_url, notice: 'Booking detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_detail
      @booking_detail = BookingDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_detail_params
      params.fetch(:booking_detail, {})
    end
end
