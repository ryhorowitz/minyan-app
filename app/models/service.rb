class Service < ApplicationRecord
  belongs_to :shul
  has_many :user_services
  has_many :users, through: :user_services

  validates :name, inclusion: { in: %w[Shacharit Mincha Maariv] }
  validates :datetime, presence: true
  validate :unique_name_date_shul_combination

  private

  def unique_name_date_shul_combination
    existing_service = Service.find_by(name: name, datetime: datetime, shul_id: shul_id)
    return unless existing_service && existing_service != self

    errors.add(:base, 'Service with the same name, date and shul combination already exists')
  end
end
