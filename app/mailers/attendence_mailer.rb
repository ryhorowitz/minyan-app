class AttendenceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attendence_mailer.daily_rsvps.subject
  #
  def daily_rsvps(shul, service)
    @greeting = 'Hi'
    @shul = shul
    @service = service
    @attendence = @service.users.size
    mail to: @shul.contact_email, subject: "Daily RSVPs for #{@service.name}"
  end
end
