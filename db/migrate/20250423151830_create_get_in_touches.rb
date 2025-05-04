class CreateGetInTouches < ActiveRecord::Migration[7.1]
  def change
    create_table :get_in_touches do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text   :message, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
