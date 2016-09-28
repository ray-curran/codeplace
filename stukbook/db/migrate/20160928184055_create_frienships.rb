class CreateFrienships < ActiveRecord::Migration[5.0]
  def change
    create_table :frienships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :state, default: 'pending'
      t.datetime :friended_at

      t.timestamps
    end
  end
end
