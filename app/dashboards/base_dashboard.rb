require 'administrate/base_dashboard'

class BaseDashboard < Administrate::BaseDashboard
  SELECT_WITH_OPTIONS = SelectField.with_options(
    filter_yield: ->(*args) { args.first.class.public_send(args.last.to_s.pluralize).map { |k, v| [k.humanize, k] } },
    include_blank: true
  )

  DASHBOARD_ATTRIBUTES = {
    id: Field::String,
    status: SELECT_WITH_OPTIONS,
    created_at: CustomizedDateTimeField.with_options(searchable: false),
    updated_at: CustomizedDateTimeField.with_options(searchable: false)
  }.freeze

  def display_resource(object)
    return object.first_name.humanize if object.try(:first_name).present?
    return object.title.humanize if object.try(:title).present?
    return object.id if object.id

    super
  end
end
