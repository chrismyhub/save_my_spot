class AddProfileIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :profile_id, :integer
    add_index :requests, :profile_id
  end
end
