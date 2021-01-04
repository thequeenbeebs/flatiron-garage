class PartsController < ApplicationController
    def show
        @part = Part.find(params[:id])
    end

    def new
        @part = Part.new
    end

    def create
        @part = Part.new
        @part.create(part_params)
        redirect_to part_path(@part)
    end

    def edit
        @part = Part.find(params[:id])
    end

    def update
        @part = Part.find(params[:id])
        @part.update(part_params)
        redirect_to part_path(@part)
    end

    def destroy
        @part = Part.find(params[:id])
        @part.destroy
        redirect_to parts_path
    end

    private

    def part_params
        params.require(:part).permit(:number, :description, :price, :service_record_id)
    end
end
