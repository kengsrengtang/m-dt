class CreateAdditionalRates < ActiveRecord::Migration
  def change
    create_table :additional_rates do |t|
      t.integer :price
      t.belongs_to :detail_option, index: true
      t.belongs_to :additional_service, index: true
      t.timestamps null: false
    end
  end
end
