class AddTargetGameIdsToFriendWantedPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :friend_wanted_posts, :target_game_ids, :text
  end
end
