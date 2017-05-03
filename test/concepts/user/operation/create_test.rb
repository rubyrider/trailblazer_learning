class CreateTest < ActiveSupport::TestCase
  test 'should create user record' do
    @user = User::Create.(
      full_name: 'Irfan Ahmed',
      email: 'irfandhk@gmail.com',
      token: SecureRandom.hex
    )

    assert @user['model'].valid?
  end

  test 'should generate token when token not provided' do
    @user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk@gmail.com'
    )

    assert @user['model'].token.present?
  end

  test 'should validate user form' do
    @user = User::Create.(
      full_name: 'Irfan Ahmed'
    )

    assert @user['contract.default'].errors.messages[:email].present?
  end
end