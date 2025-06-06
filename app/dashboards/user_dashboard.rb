require "administrate/base_dashboard"

class UserDashboard < BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    aadhaar_number: Field::String,
    address: Field::String,
    blood_group: SELECT_WITH_OPTIONS,
    first_name: Field::String,
    guardian_name: Field::String,
    guardian_phone_number: Field::String,
    last_name: Field::String,
    medical_history: Field::Text,
    phone_number: Field::String,
    joining_date: Field::Date,
    full_name: Field::String,
  }.merge(DASHBOARD_ATTRIBUTES).freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    full_name
    blood_group
    phone_number
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    first_name
    last_name
    phone_number
    blood_group
    status
    aadhaar_number
    address
    joining_date
    guardian_name
    guardian_phone_number
    medical_history
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    first_name
    last_name
    phone_number
    blood_group
    status

    aadhaar_number
    address
    joining_date

    guardian_name
    guardian_phone_number
    
    medical_history
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
