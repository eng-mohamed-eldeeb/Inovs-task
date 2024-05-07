require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "should add post" do
    assert_difference("@user.posts.count") do
      post add_post_users_url, params: { post: { title: 'Test title', body: 'Test body' } }
    end

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal 'Test title', json_response['title']
  end

  test "should add rating" do
    post = @user.posts.create!(title: 'Test title', body: 'Test body')
    assert_difference("Rating.count") do
      post add_rating_user_url(@user), params: { post_id: post.id, score: 5 }
    end

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal 5, json_response['score']
  end

  test "should get top posts" do
    get top_posts_user_url(@user)
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_not_nil json_response
  end

  test "should get posts" do
    get posts_user_url(@user)
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_not_nil json_response
  end

end
