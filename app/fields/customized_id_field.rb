require 'administrate/field/base'

class CustomizedIdField < Administrate::Field::Base
  DEFAULT_TRUNCATE_LENGTH = 11

  def to_s
    return data.to_s unless data_truncated?

    "<div class='tooltip'> #{data.to_s.truncate(data_truncate_length)} <span class='tooltip_text'>#{data}</span></div>".html_safe
  end

  def full_text
    data.to_s
  end

  def data_truncated?
    options[:truncate_data].present? ? options[:truncate_data] : false
  end

  private

  def data_truncate_length
    options[:length].present? ? options[:length] : DEFAULT_TRUNCATE_LENGTH
  end
end
