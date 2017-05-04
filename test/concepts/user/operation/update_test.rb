class UpdateTest < ActiveSupport::TestCase
  test 'should update user record' do
    user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk@gmail.com',
        token: SecureRandom.hex
    )

    @user = User::Update.(
      id: user['model'].id,
      full_name: 'Irfan Rizvi'
    )

    assert_equal @user['model'].full_name, 'Irfan Rizvi'
  end

  test 'should not update user record if input is valid' do
    user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk2@gmail.com',
        token: SecureRandom.hex
    )
    duplicate_email_user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk@gmail.com',
        token: SecureRandom.hex
    )

    @user = User::Update.(
      id: user['model'].id,
      email: duplicate_email_user['model'].email
    )

    assert @user.failure?
  end
end