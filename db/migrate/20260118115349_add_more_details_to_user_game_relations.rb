class AddMoreDetailsToUserGameRelations < ActiveRecord::Migration[8.1]
  def change
    add_reference :user_game_relations, :game_mode_2, null: true, foreign_key: { to_table: :game_modes }
    add_reference :user_game_relations, :game_role_2, null: true, foreign_key: { to_table: :game_roles }
    add_reference :user_game_relations, :game_role_3, null: true, foreign_key: { to_table: :game_roles }
  end
end
