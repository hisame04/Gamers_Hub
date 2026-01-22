json.extract! opponents_wanted_post, :id, :user_id, :start_time, :game_title_id, :game_mode_id, :voice_chat, :description, :status, :need_num, :current_need_num, :created_at, :updated_at
json.url opponents_wanted_post_url(opponents_wanted_post, format: :json)
