class GameRoleOpponentsPostRelation < ApplicationRecord
  belongs_to :game_role
  belongs_to :opponents_wanted_post
end
