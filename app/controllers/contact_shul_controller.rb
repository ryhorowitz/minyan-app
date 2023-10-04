class ContactShulController < ApplicationController
  def send_email
    recipient = Shul.find_by(name: params[:recipient]).contact_email
    message = params[:message]
    sender = current_user
    # byebug
    begin
      ContactShulMailer.send_email(recipient, message, sender).deliver_now
      render json: { 'message': 'message sent' }, status: :ok
    rescue StandardError
      flash[:error] = 'There was an error sending the email. Please try again later.'
    end
  end
end
