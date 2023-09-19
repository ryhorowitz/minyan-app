class AttendenceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attendence_mailer.daily_rsvps.subject
  #
  def daily_rsvps(shul, service)
    @greeting = 'Hi'
    @shul = Shul.find_by(name: shul)
    @service = Service.find_by(name: service)
    @attendence = @service.users.size
    mail to: @shul.contact_email, subject: "Daily RSVPs for #{@service.name}"
    puts 'in attendenceMailer.daily_rsvps'
  end
end
