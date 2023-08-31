class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :services
  has_many :user_services
end
