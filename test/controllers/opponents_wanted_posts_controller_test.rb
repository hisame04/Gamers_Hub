require "test_helper"

class OpponentsWantedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opponents_wanted_post = opponents_wanted_posts(:one)
  end

  test "should get index" do
    get opponents_wanted_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_opponents_wanted_post_url
    assert_response :success
  end

  test "should create opponents_wanted_post" do
    assert_difference("OpponentsWantedPost.count") do
      post opponents_wanted_posts_url, params: { opponents_wanted_post: { current_need_num: @opponents_wanted_post.current_need_num, description: @opponents_wanted_post.description, game_mode_id: @opponents_wanted_post.game_mode_id, game_title_id: @opponents_wanted_post.game_title_id, need_num: @opponents_wanted_post.need_num, start_time: @opponents_wanted_post.start_time, status: @opponents_wanted_post.status, user_id: @opponents_wanted_post.user_id, voice_chat: @opponents_wanted_post.voice_chat } }
    end

    assert_redirected_to opponents_wanted_post_url(OpponentsWantedPost.last)
  end

  test "should show opponents_wanted_post" do
    get opponents_wanted_post_url(@opponents_wanted_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_opponents_wanted_post_url(@opponents_wanted_post)
    assert_response :success
  end

  test "should update opponents_wanted_post" do
    patch opponents_wanted_post_url(@opponents_wanted_post), params: { opponents_wanted_post: { current_need_num: @opponents_wanted_post.current_need_num, description: @opponents_wanted_post.description, game_mode_id: @opponents_wanted_post.game_mode_id, game_title_id: @opponents_wanted_post.game_title_id, need_num: @opponents_wanted_post.need_num, start_time: @opponents_wanted_post.start_time, status: @opponents_wanted_post.status, user_id: @opponents_wanted_post.user_id, voice_chat: @opponents_wanted_post.voice_chat } }
    assert_redirected_to opponents_wanted_post_url(@opponents_wanted_post)
  end

  test "should destroy opponents_wanted_post" do
    assert_difference("OpponentsWantedPost.count", -1) do
      delete opponents_wanted_post_url(@opponents_wanted_post)
    end

    assert_redirected_to opponents_wanted_posts_url
  end
end
