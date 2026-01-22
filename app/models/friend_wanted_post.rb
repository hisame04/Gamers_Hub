class FriendWantedPost < ApplicationRecord
  belongs_to :user
  serialize :target_game_ids, coder: YAML, type: Array

  validate :must_have_games

  private
  def must_have_games
    if target_game_ids.blank? || target_game_ids.reject(&:blank?).empty?
      errors.add(:base, "ゲームを少なくとも1つ選択してください")
    end
  end
end
