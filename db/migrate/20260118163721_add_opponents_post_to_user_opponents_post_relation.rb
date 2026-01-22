class AddOpponentsPostToUserOpponentsPostRelation < ActiveRecord::Migration[8.1]
  def change
    add_reference :user_opponents_post_relations, :opponents_wanted_post, null: false, foreign_key: true
  end
end
