class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validate :no_dups
  def no_dups
    existing_user_service = UserService.find_by(user_id: user_id, service_id: service_id)

    return unless existing_user_service && existing_user_service != self

    errors.add(:base, 'Cannot RSVP to the same service twice.')
  end
end
