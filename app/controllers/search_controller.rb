class SearchController < ApplicationController
  def index
    @posts =
      if params[:term].nil?
        Array.new
      else
        Dish.search params[:term]
      end
  end
  def search
    @dishes = Dish.ransack(name_cont: params[:q]).result(distinct: true)
    respond_to do |format| 
      format.html {}
      format.json {
        @dishes = @dishes.limit(5)
      }
    end
  end
end