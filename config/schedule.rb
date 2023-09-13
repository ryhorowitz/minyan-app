# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# Creates a output log for you to view previously run cron jobs
set :output, 'log/cron.log'

# Sets the environment to run during development mode (Set to production by default)
set :environment, 'development'
#  Sets time to 24hr clock e.g. 15:00 == 3:00pm
set :chronic_options, hours24: true
every 1.minutes do
  # Tasks defined here will run once a minute
  rake 'example:say_hello'
end

# at the time of the scheduled appointment create new appointment
every 1.day, at: '7:15am' do
  rake 'service:create_bnai_shacharit_service'
end

# emails shuls contact_email daily at 6am with number of people who rsvp'd
every 1.minute do
  rake 'AttendenceMailer:daily_rsvps'
end

# 'Bnai Abraham','Shacharit'
