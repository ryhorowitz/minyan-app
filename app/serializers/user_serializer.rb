class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  # has_many :services
  # remove past services from data sent to client
  has_many :user_services
end
