class UserGameRelation < ApplicationRecord
  belongs_to :user
  belongs_to :game_title

  PLAY_STYLES = [
    { id: 1, name: 'ガチ勢', description: '勝つことを最優先にプレイしたい' },
    { id: 2, name: '上達志向', description: 'アドバイスし合って強くなりたい' },
    { id: 3, name: 'エンジョイ勢', description: '勝敗を気にせず楽しく遊びたい' },
    { id: 4, name: '初心者', description: '始めたばかりの人やまだこれから頑張る人' },
    { id: 5, name: 'わいわい', description: 'おしゃべりしながら交流したい' }
  ].freeze

  belongs_to :game_role, optional: true
  belongs_to :game_role_2, class_name: 'GameRole', optional: true
  belongs_to :game_role_3, class_name: 'GameRole', optional: true

  belongs_to :game_mode, optional: true
  belongs_to :game_mode_2, class_name: 'GameMode', optional: true

  validates :game_title_id, uniqueness: {scope: :user_id, message: "は既に追加されています"}

  def play_style_name
    style = PLAY_STYLES.find { |s| s[:id] == self.play_style }
    style ? style[:name] : '未設定'
  end
end
