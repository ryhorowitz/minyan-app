namespace :service do
  desc 'create new Shacharit service at Bnai every morning'
  task create_bnai_shacharit_service: :environment do
    Service.create!(
      name: 'Shacharit',
      shul_id: 1,
      date: Date.today + 1.day,
      time: Time.zone.parse('7:15')
    )
    puts 'new Shacharit service at Bnai every morning ran at 7:15am'
  end

  # desc 'create new Shacharit service at Bnai TEST'
  # task create_bnai_shacharit_service_TEST: :environment do
  #   Service.create!(
  #     name: 'Shacharit',
  #     shul_id: 1,
  #     date: Date.today + 2.day,
  #     time: Time.zone.parse('12:15')
  #   )
  #   puts 'TEST every minute new Shacharit service at Bnai every morning ran'
  # end
end
