class AddVehicleIdToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :vehicle_id, :string
    add_index :profiles, :vehicle_id
  end
end
