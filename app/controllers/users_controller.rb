class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.user_game_relations.build if @user.user_game_relations.empty?
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice:"プロフィールを更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :photo, :gender, user_game_relations_attributes:[:id, :game_title_id, :play_style, :game_role_id, :game_role_2_id, :game_role_3_id, :game_mode_id, :game_mode_2_id, :_destroy])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user == current_user
  end

end
