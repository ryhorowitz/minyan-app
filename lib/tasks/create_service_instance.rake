namespace :create_service_instance do
  desc 'Creates a new instance if the Service model'
  task create_bnai_shacharit_service: :environment do
    puts 'new Shacharit service at Bnai every morning ran at 7:15am'
    Service.create!(
      name: 'Shacharit',
      shul_id: 1,
      date: Date.today + 1.day,
      time: Time.zone.parse('7:15')
    )
    puts "Created at #{Time.now}"
  end
end
