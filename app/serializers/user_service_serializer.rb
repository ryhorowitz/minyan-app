class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :parsed_date, :parsed_time, :service_shul_name

  def service_name
    object.service.name
  end

  def service_shul_name
    object.service.shul.name
  end

  def parsed_time
    object.service.time.strftime('%I:%M %p')
          .sub('AM', 'a.m.') # sub out AM for a.m
          .sub('PM', 'p.m.')
          .gsub(/^0/, '') # gets rid of leading 0
  end

  def parsed_date
    Date.parse(object.service.date.to_s)
        .strftime('%a %B %e, %Y')
  end
end
