require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user with required input" do
    assert_difference('User.count') do
      post users_url, params: { email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed'}, as: :json
    end

    assert_response 201
  end

  test 'should not create user with incomplete input' do
    post users_url, params: { email: 'irfandhk@gmail.com'}, as: :json

    resp = JSON.parse(response.body)

    assert_equal resp['errors']['full_name'], ["can't be blank"]
    assert_response 422
  end
end
