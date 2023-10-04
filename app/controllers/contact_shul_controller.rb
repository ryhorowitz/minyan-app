class ContactShulController < ApplicationController
  def send_email
    recipient = Shul.find_by(name: params[:recipient]).contact_email
    message = params[:message]
    sender = current_user
    # byebug
    begin
      ContactShulMailer.send_email(recipient, message, sender).deliver_now
      render json: { 'message': 'contact email successfully sent' }, status: :ok
    rescue StandardError e
      logger.error "An error occurred: #{e.message}"
      render json: { error: "There was an error sending the email. Please try again later." }, status: :internal_server_error
    end
  end
end
