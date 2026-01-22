class UserOpponentsPostRelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = OpponentsWantedPost.find(params[:opponents_wanted_post_id])
    entry = current_user.user_opponents_post_relations.new(opponents_wanted_post_id: post.id)
    entry.save
  end

  def destroy
    post = OpponentsWantedPost.find(params[:opponents_wanted_post_id])
    entry = current_user.user_opponents_post_relations.find_by(opponents_wanted_post_id: post.id)
    
    entry&.destroy
  end
end
