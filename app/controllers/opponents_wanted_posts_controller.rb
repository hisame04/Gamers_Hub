class OpponentsWantedPostsController < ApplicationController
  before_action :set_opponents_wanted_post, only: %i[ show edit update destroy ]

  # GET /opponents_wanted_posts or /opponents_wanted_posts.json
  def index
    @opponents_wanted_posts = OpponentsWantedPost.all
  end

  # GET /opponents_wanted_posts/1 or /opponents_wanted_posts/1.json
  def show
    @opponents_wanted_post = OpponentsWantedPost.find(params[:id])
  end

  # GET /opponents_wanted_posts/new
  def new
    @opponents_wanted_post = OpponentsWantedPost.new
    @opponents_wanted_post.start_time = Time.current.beginning_of_hour + 1.hour
  end

  # GET /opponents_wanted_posts/1/edit
  def edit
  end

  # GET /students/search
  def search
  end

  # POST /students/search
  def result
    #一旦全件取得
    @opponents_wanted_posts = OpponentsWantedPost.all

    #ゲームタイトルで絞る
    if params[:game_title_id].present?
      @opponents_wanted_posts = @opponents_wanted_posts.where(game_title_id: params[:game_title_id])
    end

    #日時以降で絞る
    if params[:start_time].present?
      search_time = Time.zone.parse(params[:start_time])
      @opponents_wanted_posts = @opponents_wanted_posts.where('start_time >= ?', search_time)
    end

    #ボイスチャット有無で絞る
    if params[:voice_chat].present?
      @opponents_wanted_posts = @opponents_wanted_posts.where(voice_chat: params[:voice_chat])
    end

    #募集状態で絞る
    if params[:status].present?
      @opponents_wanted_posts = @opponents_wanted_posts.where(status: params[:status])
    end
    
    render :result
  end

  # POST /opponents_wanted_posts or /opponents_wanted_posts.json
  def create
    @opponents_wanted_post = OpponentsWantedPost.new(opponents_wanted_post_params)

    @opponents_wanted_post.user_id = current_user.id 
    @opponents_wanted_post.status = false

    @opponents_wanted_post.current_need_num = @opponents_wanted_post.need_num

    respond_to do |format|
      if @opponents_wanted_post.save
        format.html { redirect_to @opponents_wanted_post, notice: "Opponents wanted post was successfully created." }
        format.json { render :show, status: :created, location: @opponents_wanted_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opponents_wanted_post.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /opponents_wanted_posts/1 or /opponents_wanted_posts/1.json
  def update
    respond_to do |format|
      if @opponents_wanted_post.update(opponents_wanted_post_params)
        format.html { redirect_to @opponents_wanted_post, notice: "Opponents wanted post was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @opponents_wanted_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opponents_wanted_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opponents_wanted_posts/1 or /opponents_wanted_posts/1.json
  def destroy
    @opponents_wanted_post.destroy!

    respond_to do |format|
      format.html { redirect_to opponents_wanted_posts_path, notice: "Opponents wanted post was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opponents_wanted_post
      @opponents_wanted_post = OpponentsWantedPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def opponents_wanted_post_params
      params.expect(opponents_wanted_post: [ :start_date_part, :start_time_part, :game_title_id, :game_mode_id, :voice_chat, :description, :status, :need_num, game_role_ids: []])
    end
end
