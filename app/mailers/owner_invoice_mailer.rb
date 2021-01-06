class OwnerInvoiceMailer < ApplicationMailer

  default from: 'notifications@example.com'
  
  def invoice_email
    @owner = params[:owner]
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: 'Thanks for using Flatiron Garage. Invoice enclosed.')
    # byebug
  end
  
    

end
