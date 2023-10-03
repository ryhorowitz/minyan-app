# Minyan Maker

## Description

This full stack app allows the user to RSVP for the upcoming minyans (synagouge services) in Center City Philadelphia. 

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
Add the below code and replace the starred out fields with your Gmail credentials. 
```
    EMAIL_ENABLE_STARTTLS_AUTO=true
    EMAIL_PASSWORD=********** #use your own google app password
    EMAIL_PORT=587
    EMAIL_SMTP_ADDRESS=smtp.gmail.com
    EMAIL_SMTP_AUTHENTICATION=plain
    EMAIL_USERNAME=**********@gmail.com #google email you will be sending from.
```
If you need help getting a Google App password see this link (https://support.google.com/accounts/answer/185833?hl=en)

## Run it!

You can use the following commands to run the application:

- `rails s`: run the backend on [http://localhost:3000](http://localhost:3000)
- `npm start --prefix client`: run the frontend on
  [http://localhost:4000](http://localhost:4000)


