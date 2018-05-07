class ReviewsController < ApplicationController
  before_action :find_review, except: %i(new create)
  before_action :find_location, except: %i(create show)
  attr_reader :review, :location

  def show
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, target: review)
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  def create
    @review = Review.new review_params
    if review.save
      location = Location.find(review_params[:location_id])
      location.update_attributes(rate_avg: 
        ((location.sum_rate * location.rate_avg + @review.rate_score)/(location.sum_rate + 1)),
          sum_rate: (location.sum_rate + 1))
      redirect_to location
      sweetalert_success('Create success.', 'Successfully created', persistent: 'Awesome!')
    else
      sweetalert_success('create Unsuccess', 'Not create', persistent: 'Awesome!')
      redirect_to :back
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def find_location
    @location = Location.find_by id: params[:location_id]
  end

  def find_review
    @review = Review.find_by id: params[:id]
  end
end
