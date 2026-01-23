class FriendWantedPostsController < ApplicationController
  before_action :set_friend_wanted_post, only: %i[ show edit update destroy ]

  # GET /friend_wanted_posts or /friend_wanted_posts.json
  def index
    @friend_wanted_posts = FriendWantedPost.all
  end

  # GET /friend_wanted_posts/1 or /friend_wanted_posts/1.json
  def show
  end

  # GET /friend_wanted_posts/new
  def new
    @friend_wanted_post = FriendWantedPost.new
  end

  # GET /friend_wanted_posts/1/edit
  def edit
  end

  # GET /friend_wanted_posts/search
  def search
  end

  # POST /friend_wanted_posts/search
  def result
    @friend_wanted_posts = FriendWantedPost.all

    #ゲームタイトルで絞る
    if params[:target_game_ids].present?
      @friend_wanted_posts = @friend_wanted_posts.where(target_game_ids: params[:target_game_ids])
    end
    
    #プレイスタイルで絞る
    if params[:play_style].present?
      @friend_wanted_posts = @friend_wanted_posts.where(play_style: params[:play_style])
    end

    render :result
  end

  # POST /friend_wanted_posts or /friend_wanted_posts.json
  def create
    @friend_wanted_post = FriendWantedPost.new(friend_wanted_post_params)

    @friend_wanted_post.user_id = current_user.id

    respond_to do |format|
      if @friend_wanted_post.save
        format.html { redirect_to @friend_wanted_post, notice: "Friend wanted post was successfully created." }
        format.json { render :show, status: :created, location: @friend_wanted_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_wanted_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_wanted_posts/1 or /friend_wanted_posts/1.json
  def update
    respond_to do |format|
      if @friend_wanted_post.update(friend_wanted_post_params)
        format.html { redirect_to @friend_wanted_post, notice: "Friend wanted post was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @friend_wanted_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_wanted_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_wanted_posts/1 or /friend_wanted_posts/1.json
  def destroy
    @friend_wanted_post.destroy!

    respond_to do |format|
      format.html { redirect_to friend_wanted_posts_path, notice: "Friend wanted post was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_wanted_post
      @friend_wanted_post = FriendWantedPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def friend_wanted_post_params
      params.require(:friend_wanted_post).permit(:introduction, target_game_ids: [])
    end
end
