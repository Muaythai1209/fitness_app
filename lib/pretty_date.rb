module PrettyDate
  def self.to_date(date, format: :date_format)
    return '-' if date.blank?
    return date if date.is_a?(String)

    I18n.l(date, format: format.to_sym)
  end

  def self.to_date_time(date_time)
    return '-' if date_time.blank?
    return date_time if date_time.is_a?(String)

    I18n.l(date_time, format: :date_time_format)
  end
end
