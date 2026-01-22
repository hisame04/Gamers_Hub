class CreateGameRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :game_roles do |t|
      t.string :name
      t.string :role_type
      t.references :game_title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
