class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
    end

    def show
        @mechanic = Mechanic.find(params[:id])
    end

    def new
        @mechanic = Mechanic.new
    end

    def create
        @mechanic = Mechanic.new
        @mechanic.create(mechanic_params)
        redirect_to mechanic_path(@mechanic)
    end

    def edit
        @mechanic = Mechanic.find(params[:id])
    end

    def update
        @mechanic = Mechanic.find(params[:id])
        @mechanic.update(mechanic_params)
        redirect_to mechanic_path(@mechanic)
    end

    def destroy
        @mechanic = Mechanic.find(params[:id])
        @mechanic.destroy
        redirect_to mechanics_path
    end

    private

    def mechanic_params
        params.require(:mechanic).permit(:name, :years_experience, :hire_date, :hourly_price)
    end
end
