class ServicesController < ApplicationController
    def index
        @services = Service.all
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new
        @service.create(service_params)
        redirect_to services_path
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
        @service = Service.find(params[:id])
        @service.update(service_params)
        redirect_to services_path
    end

    def destroy
        @service = Service.find(params[:id])
        @service.destroy
        redirect_to services_path
    end

    private

    def service_params
        params.require(:service).permit(:service_description, :labor_estimate)
    end
end
