class CreateUsergamerelations < ActiveRecord::Migration[8.1]
  def change
    create_table :usergamerelations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_title, null: false, foreign_key: true
      t.references :game_role, null: false, foreign_key: true
      t.references :game_mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
