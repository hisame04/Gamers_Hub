class CreateGameRoleOpponentsPostRelations < ActiveRecord::Migration[8.1]
  def change
    create_table :game_role_opponents_post_relations do |t|
      t.references :game_role, null: false, foreign_key: true
      t.references :opponents_wanted_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
