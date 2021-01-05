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
        @car = Car.new(car_params)
        if @car.valid?
            @car.save
            redirect_to car_path(@car)
        else
            flash[:errors] = @car.errors.full_messages
            render :new
        end      
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        if @car.update(car_params)
            redirect_to car_path(@car)
        else
            flash[:errors] = @car.errors.full_messages
            render :edit
        end
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        redirect_to cars_path
    end

    private

    def car_params
        params.require(:car).permit(:year, :make, :model, :owner_id)
    end
end
