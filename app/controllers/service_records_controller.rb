class ServiceRecordsController < ApplicationController
    
    before_action :require_login
    
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
        @service_record = ServiceRecord.new(service_record_params)
        @owner = @service_record.car.owner
        if @service_record.valid?
            @service_record.save
            
            respond_to do |format|
                if @service_record.save
                  # Tell the Mailer to send an invoice email after save
                  OwnerInvoiceMailer.with(owner: @owner).invoice_email.deliver_now
          
                  format.html { redirect_to service_record_path(@service_record, notice: 'Invoice was successfully sent') }
                  format.json { render json: @owner, status: :created, location: @owner }
                else
                  format.html { render action: 'new' }
                  format.json { render json: @owner.errors, status: :unprocessable_entity }
                end
              end
            
        else
            flash[:errors] = @service_record.errors.full_messages
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
            flash[:errors] = @service_record.errors.full_messages
            render :edit
        end
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
