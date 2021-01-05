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
        @mechanic = Mechanic.new(mechanic_params)
        if @mechanic.valid?
            @mechanic.save
            redirect_to mechanic_path(@mechanic)
        else
            flash[:errors] = @mechanic.errors.full_messages
            render :new
        end
    end

    def edit
        @mechanic = Mechanic.find(params[:id])
    end

    def update
        @mechanic = Mechanic.find(params[:id])
        if @mechanic.update(mechanic_params)
            redirect_to mechanic_path(@mechanic)
        else
            flash[:errors] = @mechanic.errors.full_messages
            render :edit
        end
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
