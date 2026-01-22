require "test_helper"

class FriendWantedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_wanted_post = friend_wanted_posts(:one)
  end

  test "should get index" do
    get friend_wanted_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_wanted_post_url
    assert_response :success
  end

  test "should create friend_wanted_post" do
    assert_difference("FriendWantedPost.count") do
      post friend_wanted_posts_url, params: { friend_wanted_post: { introduction: @friend_wanted_post.introduction, play_style: @friend_wanted_post.play_style, user_id: @friend_wanted_post.user_id } }
    end

    assert_redirected_to friend_wanted_post_url(FriendWantedPost.last)
  end

  test "should show friend_wanted_post" do
    get friend_wanted_post_url(@friend_wanted_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_wanted_post_url(@friend_wanted_post)
    assert_response :success
  end

  test "should update friend_wanted_post" do
    patch friend_wanted_post_url(@friend_wanted_post), params: { friend_wanted_post: { introduction: @friend_wanted_post.introduction, play_style: @friend_wanted_post.play_style, user_id: @friend_wanted_post.user_id } }
    assert_redirected_to friend_wanted_post_url(@friend_wanted_post)
  end

  test "should destroy friend_wanted_post" do
    assert_difference("FriendWantedPost.count", -1) do
      delete friend_wanted_post_url(@friend_wanted_post)
    end

    assert_redirected_to friend_wanted_posts_url
  end
end
