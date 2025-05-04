class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :email, null: false, default: "", index: true

      t.string :full_name, null: false
      t.string :uid, null: false
      t.integer :role, null: false, default: 1
      t.integer :status, null: false, default: 1
      t.timestamps null: false
    end
  end
end
