require 'administrate/field/base'

class CustomizedDateTimeField < Administrate::Field::Base
  def to_s
    options[:date_only] ? PrettyDate.to_date(data&.to_date) : PrettyDate.to_date_time(data&.to_datetime)
  end
end
