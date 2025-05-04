class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  PHONE_REGEX = /\A^[6-9]\d{9}$\z/
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
end
