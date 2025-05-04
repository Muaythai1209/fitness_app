class CreateApplicationSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :application_settings do |t|
      t.string :key, null: false, index: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
