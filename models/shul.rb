class Shul < ApplicationRecord
  has_many :services

  validates :name, :street_address, :city, :state, :postal_code, presence: true
  validates :state, length: { is: 2 }, format: { with: /\A[A-Z]{2}\z/, message: 'should be two uppercase letters' }
  validate :postal_code_length

  private

  def postal_code_length
    return if postal_code.length == 5 || postal_code.length == 10

    errors.add(:postal_code, 'length must be either 5 or 10 characters')
  end
end
