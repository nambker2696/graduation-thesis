class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  attr_reader :category, :location
  def show
  end
end