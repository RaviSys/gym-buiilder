class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def admin_email
    'admin@mygym.com'
  end 
end
