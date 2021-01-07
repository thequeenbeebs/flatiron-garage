class OwnerInvoiceMailer < ApplicationMailer

  default from: 'notifications@example.com'
  
  def invoice_email
    @owner = params[:owner]
    @service_record = params[:service_record]
   
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: 'Thanks for using Flatiron Garage. Invoice enclosed.')
  end
  
    

end
