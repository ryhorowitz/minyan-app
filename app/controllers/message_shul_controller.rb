class MessageShulController < ApplicationController
  def send_email
    recipient = params[:recipient]
    message = params[:message]

    MessageShulMailer.send_email(recipient, message).deliver_now
  end
end
