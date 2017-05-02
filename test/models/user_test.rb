require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(full_name: 'Irfan Ahmed', email: 'irfandhk@gmail.com')
  end

  test 'should generate token itself' do
    assert @user.token.present?
  end

  test 'should have full_name attribute' do
    assert_equal(@user.full_name, 'Irfan Ahmed')
  end

  test 'should create a new user with full_name and email' do
    assert_difference 'User.count' do
      User.create!(full_name: 'Irfan Ahmed', email: 'irfandhk@gmail.com')
    end
  end
end
