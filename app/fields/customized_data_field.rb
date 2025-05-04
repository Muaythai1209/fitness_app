require 'administrate/field/base'
require 'utils/converter'

class CustomizedDataField < Administrate::Field::Base
  def to_s
    return '******' if data_encryption?
    return Utils::Converter.number_to_currency(data, currency_unit) if data_convert_to_currency?
    return formatted_boolean if options[:is_boolean]
    return formatted_admin_email if options[:admin_email]

    data.to_s.presence || 'N/A'
  end

  def render_form_field(form_object, field)
    return form_object.number_field field.attribute, step: 'any' if options[:currency_format]
    return form_object.check_box field.attribute if options[:is_boolean]

    form_object.text_field field.attribute
  end

  private

  def formatted_admin_email
    data.to_s.presence || 'System'
  end

  def data_encryption?
    options[:encryption]
  end

  def data_convert_to_currency?
    options[:currency_format]
  end

  def currency_unit
    options[:currency_unit].presence || 'Rp. '
  end

  def formatted_boolean
    value = data ? 'Yes' : 'No'
    options[:color_format] ? color_format_boolean_value(value).html_safe : value
  end

  def color_format_boolean_value(value)
    "<span class='#{text_color_class}'>#{value}</span>"
  end

  def text_color_class
    data ? 'text-success' : 'text-danger'
  end
end
