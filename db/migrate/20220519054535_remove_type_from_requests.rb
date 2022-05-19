class RemoveTypeFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :type, :string
  end
end
