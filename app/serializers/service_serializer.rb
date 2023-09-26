class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :datetime, :users
  has_many :user_services
end
