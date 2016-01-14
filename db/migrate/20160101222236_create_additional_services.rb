class CreateAdditionalServices < ActiveRecord::Migration
  def change
    create_table :additional_services do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
