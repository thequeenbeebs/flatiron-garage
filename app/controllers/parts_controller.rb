class PartsController < ApplicationController
    
    before_action :require_login
    
    def show
        @part = Part.find(params[:id])
    end

    def new
        @part = Part.new
    end

    def create
        @part = Part.new(part_params)
        if @part.valid?
            @part.save
            redirect_to part_path(@part)
        else
            flash[:errors] = @part.errors.full_messages
            render :new
    end

    def edit
        @part = Part.find(params[:id])
    end

    def update
        @part = Part.find(params[:id])
        if @part.update(part_params)
            redirect_to part_path(@part)
        else
            flash[:errors] = @part.errors.full_messages
            render :edit
        end
    end

    def destroy
        @part = Part.find(params[:id])
        @service_record = @part.service_record
        @part.destroy
        redirect_to service_record_path(@service_record)
    end

    private

    def part_params
        params.require(:part).permit(:number, :description, :price, :service_record_id)
    end
end
