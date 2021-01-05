class OwnerMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def welcome_email
    @owner = params[:owner]
    @url  = 'http://example.com/login'
    mail(to: @owner.email, subject: 'Welcome to My Awesome Site')
  end

end
