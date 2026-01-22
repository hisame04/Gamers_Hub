class CreateUserOpponentsPostRelations < ActiveRecord::Migration[8.1]
  def change
    create_table :user_opponents_post_relations do |t|
      t.timestamps
    end
  end
end
