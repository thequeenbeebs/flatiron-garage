class ServiceRecordsController < ApplicationController
    before_action :require_login
    
    def index
        if !params[:mechanic].blank?
            @service_records = ServiceRecord.by_mechanic(params[:mechanic]) 
        else
            @service_records = ServiceRecord.all.order("date_of_service DESC")
        end
        @mechanics = Mechanic.all
    end

    def show
        @service_record = ServiceRecord.find(params[:id])
    end

    def new
        @service_record = ServiceRecord.new
        @service_record.parts.build
    end

    def create
        @service_record = ServiceRecord.new(service_record_params)
        @owner = @service_record.car.owner
        
        if @service_record.valid?
            @service_record.save
            
            respond_to do |format|
                if @service_record.save
                  # Tell the Mailer to send an invoice email after save
                  OwnerInvoiceMailer.with(owner: @owner, service_record: @service_record ).invoice_email.deliver_now
          
                  format.html { redirect_to service_record_path(@service_record, notice: 'Invoice was successfully sent') }
                  format.json { render json: @owner, status: :created, location: @owner }
                else
                  format.html { render action: 'new' }
                  format.json { render json: @owner.errors, status: :unprocessable_entity }
                end
              end
            
        else
            render :new
        end
    end

    def edit
        @service_record = ServiceRecord.find(params[:id])
    end

    def update
        @service_record = ServiceRecord.find(params[:id])
        if @service_record.update(service_record_params)
            redirect_to service_record_path(@service_record)
        else
            render :edit
        end
    end

    def destroy
        @service_record = ServiceRecord.find(params[:id])
        @parts = @service_record.parts
        @service_record.destroy
        @parts.each {|part| part.destroy}
        redirect_to service_records_path
    end

    private

    def service_record_params
        params.require(:service_record).permit(:car_id, :service_id, :mechanic_id, :date_of_service, :labor_hours, :note, parts_attributes: [:number, :description, :price])
    end
end
