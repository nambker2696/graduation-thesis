class LikesController < ApplicationController
  skip_before_action :authenticate_user!
  attr_reader :like

  def create
    @like = Like.new
    @location = Location.find_by id: params[:location_id]
    like.target = @location
    like.user_id = current_user.id
    if like.save
      # session[:like_id] = @like.id
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    @location = Location.find_by id: params[:review_id]
    if like.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
