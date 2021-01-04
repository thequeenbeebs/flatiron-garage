class CarsController < ApplicationController
    def home
    end

    def show
        @car = Car.find(params[:id])
    end

    def new
        @car = Car.new
    end

    def create
        @car = Car.new
        @car.create(car_params)
        redirect_to car_path(@car)
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        @car.update(car_params)
        redirect_to car_path(@car)
    end

    def destroy
        @car = Car.find(params[:id])
        @owner = @car.owner
        @car.destroy
        redirect_to owner_path(@owner)
    end

    private

    def car_params
        params.require(:car).permit(:year, :make, :model, :owner_id)
    end
end
