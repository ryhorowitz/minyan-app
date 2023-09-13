class SignupMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = 'Hi'
    @user = user
    mail(
      to: @user.email,
      subject: "Thank you for Signing up #{@user.username}"
    )
  end
end
