class CreateFriendWantedPosts < ActiveRecord::Migration[8.1]
  def change
    create_table :friend_wanted_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :play_style
      t.text :introduction

      t.timestamps
    end
  end
end
