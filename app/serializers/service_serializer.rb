class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :datetime, :users
end
