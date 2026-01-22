class AddUserToUserOpponentsPostRelation < ActiveRecord::Migration[8.1]
  def change
    add_reference :user_opponents_post_relations, :user, null: false, foreign_key: true
  end
end
