class CreateGamemodes < ActiveRecord::Migration[8.1]
  def change
    create_table :gamemodes do |t|
      t.string :name
      t.integer :max_players
      t.references :game_title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
