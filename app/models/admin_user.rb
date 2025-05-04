class AdminUser < ApplicationRecord
  # audited

  # enums
  enum status: { active: 1, inactive: 2 }
  enum role: { backend_admin: 1, super_admin: 2 }

  # validations
  validates :uid, :role, :status, presence: true
  validates :email, presence: true
  validates :full_name, presence: true, length: { minimum: 2 }

  # methods
  def self.from_google(email:, full_name:, uid:)
    return nil unless email =~ VALID_EMAIL_REGEX
    emails = ApplicationSetting.allowed_emails.split(',')
    return nil unless emails.include?(email)

    create_with(uid: uid, full_name: full_name, status: :inactive).find_or_create_by!(email: email)
  end
end
