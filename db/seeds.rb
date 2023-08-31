# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)'
puts '📃 Seeding data...'
user_1 = User.create!(username: 'rywitz', email: 'rywitz@fakemail.com', password: '1234',
                      password_confirmation: '1234', admin: false)
user_2 = User.create!(username: 'pizzaMan', email: 'pizzaMan@fakemail.com', password: '1234',
                      password_confirmation: '1234', admin: false)
user_3 = User.create!(username: 'mr.softee', email: 'mr.softee@fakemail.com', password: '1234',
                      password_confirmation: '1234', admin: false)
user_4 = User.create!(username: 'celia', email: 'celia@fakemail.com', password: '1234', password_confirmation: '1234',
                      admin: false)
user_5 = User.create!(username: 'person5', email: 'person5@fakemail.com', password: '1234',
                      password_confirmation: '1234', admin: false)

Shul.create!(name: "B'nai Abraham",
             street_address: '527 Lombard St',
             city: 'Philadelphia',
             state: 'PA',
             postal_code: '19147',
             img: 'https://upload.wikimedia.org/wikipedia/commons/2/22/Congregation_B%27nai_Abraham_527_Lombard%2C_Philly.JPG')
Shul.create!(name: 'Mamash',
             street_address: '1601-03 Lombard Street',
             city: 'Philadelphia',
             state: 'PA',
             postal_code: '19146',
             img: 'https://images.givelively.org/nonprofits/02c27ab6-551c-45c5-b0e7-1e3a84fe7b5f/social_images/chabad-young-philly_original_27a2bff528563d6312491bcae8195ffdc7d86ac0d5b4b075f9ca5859dec7c70d_social.jpg')
Shul.create!(name: 'Shtiebl',
             street_address: '1321 South Juniper Street',
             city: 'Philadelphia',
             state: 'PA',
             postal_code: '19147',
             img: 'https://www.jewishexponent.com/wp-content/uploads/2019/07/65640757_624638288035072_182707891591970816_n.jpg')

tomorrow = Time.now + 1.day
tomorrow_at_715 = tomorrow.change(hour: 7, min: 15)
tomorrow_at_1530 = tomorrow.change(hour: 15, min: 30)
tomorrow_at_1930 = tomorrow.change(hour: 19, min: 30)
# only shacharit for initial dev
Service.create!(
  name: 'Shacharit',
  shul_id: 1,
  date: Date.today + 1.day,
  time: Time.zone.parse('7:15')
)
# Service.create!(
#   name: 'Mincha',
#   shul_id: 1,
#   date: Time.now + 1.day,
#   time: Time.zone.parse('15:00')
# )
# Service.create!(
#   name: 'Maariv',
#   shul_id: 1,
#   date: Time.now + 1.day,
#   time: Time.zone.parse('19:30')
# )

user_1.user_services.create!(service_id: 1)
user_3.user_services.create!(service_id: 1)
user_2.user_services.create!(service_id: 1)
user_4.user_services.create!(service_id: 1)
user_5.user_services.create!(service_id: 1)
puts 'Seeded'

# if the day is sunday then shacharit is 8:30
# if it is saturday it is 9:30
