class HomeController < ApplicationController
  def index
    @cars = Car.cars_in_garage
  end
end
