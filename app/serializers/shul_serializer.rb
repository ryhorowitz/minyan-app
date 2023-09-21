class ShulSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state,
             :postal_code, :img
  has_many :services, serializer: ServiceSerializer

  # custom scope of last three services can;t figure out
  # do
  # def last_three_serviceszzz
  #   object.services.first
  # en
  # end

  # maybe make a custom address Serializer
end
