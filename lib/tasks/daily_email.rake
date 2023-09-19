namespace :daily_email do
  desc 'Send Daily email with Bnai Shacharit rsvps'
  task bani_shacharit_rsvps: :environment do
    AttendenceMailer.daily_rsvps('Bnai Abraham', 'Shacharit').deliver_now
    puts 'in daily_email rake file'
  end
end
