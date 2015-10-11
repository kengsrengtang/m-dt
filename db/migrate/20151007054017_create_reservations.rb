class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :city
      t.string :company_name
      t.datetime :res_date
      t.time :time
      t.text :special_need
      t.text :vehicle_info
      t.string :status

      t.timestamps null: false
    end
  end
end
