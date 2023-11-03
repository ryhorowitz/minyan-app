# Minyan Maker

## Description

This full stack app allows the user to RSVP for the upcoming minyans (synagogue services) in Center City Philadelphia. Minyan Maker sends out scheduled emails to the Synagouge's Rabbi or contact person 1 hour before the service letting them know how many people RSVP'd. This app also has email functionality so the user may message the synagouge to ask questions.

## Real World Need

Some synagouges in Philadelphia will not hold services unless they know that 10 people will show up. This app allows Rabbi's to know in advance if they should cancel services.

## Requirements

- Ruby 2.7.4
- NodeJS (v16), and npm
- Postgresql

## Setup

Start by **cloning** the app repository.

When you're ready to start building your project, run this code in two separate terminals:

```sh
#Backend Terminal
bundle install
rails db:create
rails db:migrate 
rails db:seed

#Frontend Terminal
npm install --prefix client

```

## Action Mailer Config

This app uses the `dotenv-rails` gem for storing email credentials.
From the root directory create a `.env` file.

```sh
touch .env
```

In the .env file, add the below code and replace the starred out fields with your Gmail credentials. 
```
    EMAIL_ENABLE_STARTTLS_AUTO=true
    EMAIL_PASSWORD=********** #use your own google app password
    EMAIL_PORT=587
    EMAIL_SMTP_ADDRESS=smtp.gmail.com
    EMAIL_SMTP_AUTHENTICATION=plain
    EMAIL_USERNAME=**********@gmail.com #google email you will be sending from.
```
If you need help getting a Google App password see this [link](https://support.google.com/accounts/answer/185833?hl=en).

In the dev/congif/development.rb
## Run it!

You can use the following commands to run the application:

- `rails s`: run the backend on [http://localhost:3000](http://localhost:3000)
- `npm start --prefix client`: run the frontend on
  [http://localhost:4000](http://localhost:4000)

