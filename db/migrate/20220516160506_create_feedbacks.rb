class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.integer :rating
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
    add_index :feedbacks, :user_id
    add_index :feedbacks, :profile_id
  end
end
