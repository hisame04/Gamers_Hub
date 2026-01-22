class CreateOpponentsWantedPosts < ActiveRecord::Migration[8.1]
  def change
    create_table :opponents_wanted_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.references :game_title, null: false, foreign_key: true
      t.references :game_mode, null: false, foreign_key: true
      t.integer :voice_chat
      t.text :description
      t.boolean :status
      t.integer :need_num
      t.integer :current_need_num

      t.timestamps
    end
  end
end
