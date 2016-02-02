class AddSdoSvsSasAndPriceToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :selected_detail_option, :text
    add_column :reservations, :selected_vehicle_size, :text
    add_column :reservations, :selected_additional_service, :text
    add_column :reservations, :price, :integer
  end
end
