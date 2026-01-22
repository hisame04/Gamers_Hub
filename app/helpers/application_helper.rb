module ApplicationHelper

  def game_color(game_name)
    case game_name
    when "VALORANT"
      "#ff4655" #赤
    when "Apex Legends"
      "#FFB162" #オレンジ
    when "League of Legends"
      "#B28CFF" #紫
    when "Splatoon"
      "#FFC0EC" #ピンク
    else
      "#eeeeee"#グレー
    end
  end

  def game_text_color(game_name)
    case game_name
    when "VALORANT", "Apex Legends", "League of Legends", "Overwatch 2", "Minecraft"
      "#ffffff" 
    else
      "#333333"
    end
  end
end
