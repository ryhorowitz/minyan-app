class MessageShulMailer < ApplicationMailer

  def send_email(recipient, message)
    @message = message
    mail(to: recipient)
end
