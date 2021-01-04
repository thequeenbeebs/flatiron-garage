class ServiceRecordsController < ApplicationController
    def index
        @service_records = ServiceRecord.all
    end

    def show
        @service_record = ServiceRecord.find(params[:id])
    end

    def new
        @service_record = ServiceRecord.new
    end

    def create
        @service_record = ServiceRecord.new
        @service_record.create(service_record_params)
        redirect_to service_record_path(@service_record)
    end

    def edit
        @service_record = ServiceRecord.find(params[:id])
    end

    def update
        @service_record = ServiceRecord.find(params[:id])
        @service_record.update(service_record_params)
        redirect_to service_record_path(@service_record)
    end

    def destroy
        @service_record = ServiceRecord.find(params[:id])
        @service_record.destroy
        redirect_to service_records_path
    end

    private

    def service_record_params
        params.require(:service_record).permit(:car_id, :service_id, :mechanic_id, :date_of_service, :labor_hours, :note)
    end
end
