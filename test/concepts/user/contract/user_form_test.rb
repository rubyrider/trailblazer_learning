require 'test_helper'

class UserFormTest < ActiveSupport::TestCase
  test 'email should be present' do
    result = User::Create.(
      full_name: 'Irfan Ahmed',
      email:     'irfandhk@gmail.com',
      token:     SecureRandom.hex
    )

    assert result.success?
  end
end
