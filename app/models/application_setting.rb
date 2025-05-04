class ApplicationSetting < ApplicationRecord
  # callbacks
  before_save :upcase_fields

  # validations
  validates :key, presence: true, uniqueness: { case_sensitive: false }
  validates :value, presence: true

  # scopes
  scope :phone_number, -> { find_by(key: 'PHONE_NUMBER').value }
  scope :contact_email, -> { find_by(key: 'CONTACT_EMAIL').value }
  scope :club_address, -> { find_by(key: 'CLUB_ADDRESS').value }
  scope :allowed_emails, -> { find_by(key: 'ALLOWED_EMAILS').value }

  # methods
  def upcase_fields
    key.upcase!
  end
end
