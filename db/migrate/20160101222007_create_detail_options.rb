class CreateDetailOptions < ActiveRecord::Migration
  def change
    create_table :detail_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
