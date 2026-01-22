class CreateGameTitles < ActiveRecord::Migration[8.1]
  def change
    create_table :game_titles do |t|
      t.string :name

      t.timestamps
    end
  end
end
