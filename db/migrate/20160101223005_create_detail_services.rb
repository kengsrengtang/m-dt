class CreateDetailServices < ActiveRecord::Migration
  def change
    create_table :detail_services do |t|
      t.belongs_to :service, index: true
      t.belongs_to :detail_option, index: true
      t.timestamps null: false
    end
  end
end
