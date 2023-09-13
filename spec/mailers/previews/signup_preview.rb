# Preview all emails at http://localhost:3000/rails/mailers/signup
class SignupPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signup/welcome
  def welcome
    SignupMailer.welcome
  end

end
