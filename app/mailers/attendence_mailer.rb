class AttendenceMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attendence_mailer.daily_rsvps.subject
  #
  def daily_rsvps(shul, service)
    # find shul with name 'Bnai Abraham'
    @greeting = 'Hi'
    @shul = Shul.find_by(name: shul)
    @service = Service.find_by(name: service)
    # puts @service.users.size
    puts "contact is #{@shul.contact_email}"
    @attendence = @service.users.size
    mail to: @shul.contact_email, subject: "Daily RSVPs for #{@service.name}"
  end
end
