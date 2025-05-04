class UserFitnessPlan < ApplicationRecord
  # enums
  enum status: { active: 1, inactive: 2 }
  enum category: { monthly: 1, quarterly: 2, half_yearly: 3, yearly: 4 }

  # associations
  belongs_to :user
  belongs_to :fitness_plan

  # validations
  validates :start_date, :category, :status, presence: true

  # callbacks
  before_save       :update_fitness_pack_amount, if: :category_changed?

  # methods
  def update_fitness_pack_amount
    self.amount = fitness_plan.send(category)
  end
end
