class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :phone_number, :string
  end
end
