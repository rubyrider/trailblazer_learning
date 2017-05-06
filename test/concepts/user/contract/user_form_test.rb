require 'test_helper'

class UserFormTest < ActiveSupport::TestCase
  test 'email should be present' do
    result = User::Create.(
      full_name: 'Irfan Ahmed',
        token: SecureRandom.hex
    )

    assert result.failure?
  end

  test 'should validate unique email' do
    existing_user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk@gmail.com',
        token: SecureRandom.hex
    )

    another_existing_user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk3@gmail.com',
        token: SecureRandom.hex
    )

    result = User::Update.(
        id: existing_user['model'].id,
        full_name: 'Irfan Ahmed',
        email: another_existing_user['model'].email,
        token: SecureRandom.hex
    )

    assert result.failure?
  end
end
