class AddPlayStyleToUserGameRelation < ActiveRecord::Migration[8.1]
  def change
    add_column :user_game_relations, :play_style, :integer
  end
end
