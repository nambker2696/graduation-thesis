class SearchController < ApplicationController
  def index
    @posts =
      if params[:term].nil?
        Array.new
      else
        Dish.search params[:term]
      end
  end
end