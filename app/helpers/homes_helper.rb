module HomesHelper
  def get_main_header_class
    klass_name = 'header-section'

    action_name != "index" ? "#{klass_name} header-normal" : klass_name
  end

  def get_nav_menu_class(name)
    name == action_name ? 'active' : ''
  end

  def format_durations(duration)
    text = duration >= 12 ? 'year' : 'month'
    duration = duration >= 12 ? duration / 12 : duration

    pluralize(duration, text).titleize
  end

  def action_accessible_action?(resource, action)
    can? action, resource
  end
end
