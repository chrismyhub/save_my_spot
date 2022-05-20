class AddVehicleIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :vehicle_id, :integer
  end
end
