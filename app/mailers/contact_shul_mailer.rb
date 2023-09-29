class ContactShulMailer < ApplicationMailer
  def send_email(recipient, message, sender)
    @recipient = recipient
    @message = message
    @sender = sender
    mail(
      to: @recipient,
      subject: "New message from #{@sender.username}"
    )
  end
end
