class RemovePlayStyleFromFriendWantedPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :friend_wanted_posts, :play_style, :integer
  end
end
