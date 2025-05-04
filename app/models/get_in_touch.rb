class GetInTouch < ApplicationRecord
  # validations
  validates :phone_number, presence: true, format: { with: PHONE_REGEX }
  validates :name, length: { minimum: 2, message: "must be at least 2 characters long" }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :message, presence: true, length: { minimum: 2, message: "must be at least 2 characters long" }
end
