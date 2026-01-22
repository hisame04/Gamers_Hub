class GameTitle < ApplicationRecord
  has_many :game_role
  has_many :game_mode
  has_many :users_game_relation
end
