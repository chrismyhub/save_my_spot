class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :color
      t.string :license_plate
      t.string :make
      t.integer :year
      t.string :comments
      t.integer :profile_is
      t.integer :request_id

      t.timestamps
    end
    add_index :vehicles, :profile_is
    add_index :vehicles, :request_id
  end
end
