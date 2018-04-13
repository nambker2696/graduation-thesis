class BookTableDetailsController < ApplicationController
  before_action :set_book_table_detail, only: [:show, :edit, :update, :destroy]

  # GET /book_table_details
  # GET /book_table_details.json
  def index
    @book_table_details = BookTableDetail.all
  end

  # GET /book_table_details/1
  # GET /book_table_details/1.json
  def show
  end

  # GET /book_table_details/new
  def new
    @book_table_detail = BookTableDetail.new
  end

  # GET /book_table_details/1/edit
  def edit
  end

  # POST /book_table_details
  # POST /book_table_details.json
  def create
    @book_table_detail = BookTableDetail.new(book_table_detail_params)

    respond_to do |format|
      if @book_table_detail.save
        format.html { redirect_to @book_table_detail, notice: 'Book table detail was successfully created.' }
        format.json { render :show, status: :created, location: @book_table_detail }
      else
        format.html { render :new }
        format.json { render json: @book_table_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_table_details/1
  # PATCH/PUT /book_table_details/1.json
  def update
    respond_to do |format|
      if @book_table_detail.update(book_table_detail_params)
        format.html { redirect_to @book_table_detail, notice: 'Book table detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_table_detail }
      else
        format.html { render :edit }
        format.json { render json: @book_table_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_table_details/1
  # DELETE /book_table_details/1.json
  def destroy
    @book_table_detail.destroy
    respond_to do |format|
      format.html { redirect_to book_table_details_url, notice: 'Book table detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_table_detail
      @book_table_detail = BookTableDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_table_detail_params
      params.require(:book_table_detail).permit(:user_id, :book_table_id, :dish_id, :price)
    end
end
