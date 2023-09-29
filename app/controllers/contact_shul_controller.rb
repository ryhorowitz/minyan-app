class ContactShulController < ApplicationController
  def send_email
    recipient = Shul.find_by(name: params[:recipient]).contact_email
    message = params[:message]
    sender = current_user
    # byebug
    ContactShulMailer.send_email(recipient, message, sender).deliver_now
  end
end
