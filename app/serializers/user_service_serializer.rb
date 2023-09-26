class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name,
             :service_shul_name, :datetime
  # :upcoming_services

  # THIS IS ALL FAKAKTA********* talk over with Ben
  def service_name
    object.service.name
  end

  def service_shul_name
    object.service.shul.name
  end

  def datetime
    object.service.datetime
  end
end
