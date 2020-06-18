class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer "expert_id"
      t.integer "friend_id"
    end
  end
end
