class ContactShulMailer < ApplicationMailer
  def send_email(recipient, message, sender)
    @recipient = recipient
    @message = message
    @sender = sender
    mail(
      to: @recipient,
      subject: "New message from #{@sender.username}"
    )
  rescue StandardError => e
    flash[:error] = 'There was an error sending the email from ContactShulMailer. Please try again later.'
    redirect_to error_path
  end
end
