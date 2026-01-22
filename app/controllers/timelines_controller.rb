class TimelinesController < ApplicationController
  def index
    @active_tab = params[:tab] || 'opponent'

    if @active_tab == 'friend'
      #フレンド募集を取得
      @timeline_items = FriendWantedPost.order(created_at: :desc)
    else
      #相手募集を取得
      @timeline_items = OpponentsWantedPost.order(created_at: :desc)
  end
  end
end
