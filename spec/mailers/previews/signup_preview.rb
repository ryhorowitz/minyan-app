# Preview all emails at http://localhost:3000/rails/mailers/signup
class SignupPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/signup/welcome
  def welcome
    user = User.last
    SignupMailer.welcome(user)
  end
end
