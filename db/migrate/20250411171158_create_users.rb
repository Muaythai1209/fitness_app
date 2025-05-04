class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|

      t.string        :first_name, null: false
      t.string        :last_name, null: false
      t.string        :phone_number, null: false
      t.string        :address, null: false
      t.string        :guardian_name, null: false
      t.string        :guardian_phone_number, null: false
      t.integer       :blood_group, null: false
      t.text          :medical_history
      t.string        :aadhaar_number, null: false
      t.date          :joining_date, null: false
      t.string        :status, null: false
      t.date          :end_date

      t.timestamps
    end

    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :phone_number,                unique: true
    add_index :users, :aadhaar_number,                unique: true
    add_index :users, :blood_group
  end
end
