# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

GameTitle.destroy_all
GameMode.destroy_all
GameRole.destroy_all

#ゲームタイトルの作成
valo= GameTitle.create!(name:"VALORANT")
apex= GameTitle.create!(name:"Apex Legends")
spl= GameTitle.create!(name:"Splatoon")

#モードの作成
GameMode.create!(name:"コンペティティブ", max_players:5, game_title:valo)
GameMode.create!(name:"スイフト", max_players:5, game_title:valo)
GameMode.create!(name:"アンレート", max_players:5, game_title:valo)
GameMode.create!(name:"カスタム(カジュアル)", max_players:10, game_title:valo)
GameMode.create!(name:"カスタム(スクリム)", max_players:10, game_title:valo)
GameMode.create!(name:"スカーミッシュ", max_players:10, game_title:valo)

GameMode.create!(name:"ランク", max_players:3, game_title:apex)
GameMode.create!(name:"ワイルドカード", max_players:3, game_title:apex)
GameMode.create!(name:"ミックステープ", max_players:3, game_title:apex)
GameMode.create!(name:"プライベートマッチ", max_players:60, game_title:apex)

GameMode.create!(name:"バンカラマッチ", max_players:4, game_title:spl)
GameMode.create!(name:"ナワバリバトル", max_players:4, game_title:spl)
GameMode.create!(name:"プライベートマッチ", max_players:8, game_title:spl)
GameMode.create!(name:"サーモンラン", max_players:4, game_title:spl)

#ロールの作成
GameRole.create!(name:"デュエリスト", role_type:"role", game_title:valo)
GameRole.create!(name:"センチネル", role_type:"role", game_title:valo)
GameRole.create!(name:"コントローラー", role_type:"role", game_title:valo)
GameRole.create!(name:"イニシエーター", role_type:"role", game_title:valo)
GameRole.create!(name:"ジェット", role_type:"agent", game_title:valo)
GameRole.create!(name:"クローブ", role_type:"agent", game_title:valo)
GameRole.create!(name:"アイソ", role_type:"agent", game_title:valo)
GameRole.create!(name:"ヨル", role_type:"agent", game_title:valo)
GameRole.create!(name:"ゲッコー", role_type:"agent", game_title:valo)
GameRole.create!(name:"サイファー", role_type:"agent", game_title:valo)

GameRole.create!(name:"アサルト", role_type:"role", game_title:apex)
GameRole.create!(name:"スカーミッシャー", role_type:"role", game_title:apex)
GameRole.create!(name:"リコン", role_type:"role", game_title:apex)
GameRole.create!(name:"コントローラー", role_type:"role", game_title:apex)
GameRole.create!(name:"サポート", role_type:"role", game_title:apex)
GameRole.create!(name:"ブラッドハウンド", role_type:"agent", game_title:apex)
GameRole.create!(name:"レイス", role_type:"agent", game_title:apex)
GameRole.create!(name:"ライフライン", role_type:"agent", game_title:apex)
GameRole.create!(name:"ジブラルタル", role_type:"agent", game_title:apex)
GameRole.create!(name:"パスファインダー", role_type:"agent", game_title:apex)
GameRole.create!(name:"バンガロール", role_type:"agent", game_title:apex)

GameRole.create!(name:"シューター", role_type:"weapon", game_title:spl)
GameRole.create!(name:"ローラー", role_type:"weapon", game_title:spl)
GameRole.create!(name:"チャージャー", role_type:"weapon", game_title:spl)
GameRole.create!(name:"マニューバー", role_type:"weapon", game_title:spl)