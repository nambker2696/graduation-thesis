class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]


end
