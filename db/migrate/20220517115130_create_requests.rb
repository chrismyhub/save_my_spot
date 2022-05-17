class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :location
      t.string :australian_state
      t.string :date
      t.string :time
      t.float :reward
      t.float :no_show_penalty
      t.string :comments

      t.timestamps
    end
  end
end
