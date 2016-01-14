class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :price
      t.belongs_to :vehicle_size, index: true
      t.belongs_to :detail_option, index: true
      t.timestamps null: false
    end
  end
end
