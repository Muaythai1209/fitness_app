class CreateUserFitnessPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :user_fitness_plans do |t|
      t.references    :user
      t.references    :fitness_plan
      t.integer       :status
      t.date          :start_date
      t.date          :end_date
      t.integer       :category
      t.integer       :amount

      t.timestamps
    end
  end
end
