require 'administrate/field/base'

class SelectField < Administrate::Field::Base
  def to_s
    format_data_value
  end

  def color_formatted_data
    format_data_value(color_format: true)
  end

  def choices
    choices_values = options.key?(:filter_yield).present? ? options.fetch(:filter_yield).call(@resource, attribute) : options[:choices]
    build_choices(options, choices_values)
  end

  def selected_choice
    return nil if data.blank?

    data.is_a?(String) ? data : data.id
  end

  def others_options
    options_hash = {}
    options_hash = options_hash.merge(options.fetch(:others)) if options.key?(:others)
    options_hash
  end

  private

  def build_choices(options, choices_values)
    options[:include_blank] ? [[blank_option_custom_message(options), '']] + choices_values : choices_values
  end

  def blank_option_custom_message(options)
    options[:blank_option_custom_message].presence || 'Please Select'
  end

  def format_data_value(color_format: false)
    option_choices = options[:choices]
    data_value = option_choices.blank? ? data.to_s : option_choices.to_h.key(data)
    new_data_value = data_value.present? ? data_value.humanize : 'N/A'
    color_format ? color_format_data_value(new_data_value, data_value) : new_data_value
  end

  def color_format_data_value(new_val, old_val)
    "<span class='#{text_colored_class(old_val)}'>#{new_val}</span>"
  end

  def text_colored_class(type)
    klass = text_colored_class_for(type)
    return klass if klass.present?

    return 'badge badge-info' if %w[processed sent_to_partner processing].include? type
    return 'badge badge-running' if %w[approved_by_internal_admin].include? type
    return 'badge badge-dark' if %w[closed].include? type
  end

  def text_colored_class_for(type)
    klass_name = badge_class_for(type)
    return klass_name if klass_name.present?

    %w[in_process].include?(type) ? 'badge badge-info' : 'badge badge-secondary'
  end

  def badge_class_for(type)
    return 'badge badge-success' if %w[success active paid approved_by_partner completed efektif approved_by_user].include? type
    return 'badge badge-danger' if %w[failed restricted unpaid rejected rejected_by_partner rejected_by_user].include? type
    return 'badge badge-warning' if %w[inactive partially_paid expired data_changes_required need_signature].include? type
    return 'badge badge-primary' if %w[created draft processing submitted resubmitted sent_to_partner].include? type
    return 'badge badge-in-progress' if %w[in_progress].include? type
    return 'badge badge-processing' if %w[partner_processing].include? type
  end
end
