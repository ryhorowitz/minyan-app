# Preview all emails at http://localhost:3000/rails/mailers/attendence_mailer
class AttendenceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/attendence_mailer/daily_rsvps
  def daily_rsvps
    AttendenceMailer.daily_rsvps
  end

end
