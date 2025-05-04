class CreateFitnessPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :fitness_plans do |t|
      t.integer       :category, null: false
      t.string        :title, null: false
      t.boolean       :with_diet, default: false
      t.string        :content_video_link, null: true
      t.string        :details, null: true
      t.boolean       :personal_training, default: false

      t.integer       :monthly, null: false
      t.integer       :quarterly, null: false
      t.integer       :half_yearly, null: false
      t.integer       :yearly, null: false

      t.timestamps
    end

    add_index :fitness_plans, :title
    add_index :fitness_plans, :category
  end
end
