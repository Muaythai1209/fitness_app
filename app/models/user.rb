class User < ApplicationRecord
  # enums
  enum status: { active: 1, inactive: 2 }
  enum blood_group: { 'A+': 1, 'A-': 2, 'B+': 3, 'B-': 4, 'AB+': 5, 'AB-': 6, 'O+': 7, 'O-': 8 }

  # validations
  validates :first_name, :last_name, :address,
            :guardian_name, :blood_group, :aadhaar_number,
            :joining_date, :status, presence: true

  validates :phone_number, presence: true, format: { with: PHONE_REGEX }
  validates :guardian_phone_number, presence: true, format: { with: PHONE_REGEX }
  validates :aadhaar_number, length: { is: 12 }, numericality: { only_integer: true }, format: { with: /\A\d+\z/, message: "must contain only digits" }

  validates :first_name, length: { minimum: 2, message: "must be at least 2 characters long" }
  validates :last_name, length: { minimum: 2, message: "must be at least 2 characters long" }

  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # validates :end_date, presence: true, if: :inactive?
 
  # associations
  has_many :user_fitness_plans
  has_one :active_user_fitness_plan, -> { where(active: true) }, class_name: 'UserFitnessPlan'
  has_one :current_fitness_plan, through: :active_user_fitness_plan, source: :fitness_plan
  has_many :fitness_plans, through: :user_fitness_plans
  

  # methods
  def full_name
    first_name + last_name
  end
end
