require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "POST /users should create user with required input" do
    assert_difference('User.count') do
      post users_url, params: { email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed'}, as: :json
    end

    assert_response 201
  end

  test 'POST /users should not create user with incomplete input' do
    post users_url, params: { email: 'irfandhk@gmail.com'}, as: :json

    resp = JSON.parse(response.body)

    assert_equal resp['errors']['full_name'], ["can't be blank"]
    assert_response 422
  end

  test 'GET /user should return current user with correct authorization token' do
    @user = User::Create.(
      full_name: 'Irfan Ahmed',
      email: 'irfandhk@gmail.com'
    )

    get user_url, headers: { "HTTP_AUTHORIZATION" => "Token #{@user['model'].token}" }, as: :json
    resp = JSON.parse(response.body)

    assert_response 200
    assert_equal resp['email'], @user['model'].email
  end

  test 'GET /user should return 401 when user not authenticated' do
    get user_url, as: :json

    resp = JSON.parse(response.body)

    assert_response 401
    assert_equal resp['errors'], 'Access denied'
  end
end
