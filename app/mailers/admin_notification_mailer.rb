class AdminNotificationMailer < ApplicationMailer
  def new_enquiry_notification(contact)
    @contact = contact
    mail(to: admin_email, subject: "A new enquiry has been made")
  end
end
