class ChangeColumnsNullToUserGameRelations < ActiveRecord::Migration[8.1]
  def change
    change_column_null :user_game_relations, :game_role_id, true
    change_column_null :user_game_relations, :game_mode_id, true
  end
end
