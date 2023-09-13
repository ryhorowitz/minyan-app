module SignupNotifier
  extend ActiveSupport::Concern

  included do
    after_action :notify_new_user, only: [:create]
  end

  private

  def notify_new_user
    return unless @user.persisted?

    puts 'Sending signup email'
    SignupMailer.welcome(@user).deliver_later
  end
end
