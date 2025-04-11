module HomesHelper
  def get_main_header_class
    klass_name = 'header-section'

    action_name != "index" ? "#{klass_name} header-normal" : klass_name
  end

  def get_nav_menu_class(name)
    name == action_name ? 'active' : ''
  end
end
