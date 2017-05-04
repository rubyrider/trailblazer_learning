class ShowTest < ActiveSupport::TestCase
  test 'should display user info from run time current user' do
    user = User::Create.(
      full_name: 'Irfan Ahmed',
        email: 'irfandhk@gmail.com'
    )

    @user = User::Show.({}, {current_user: user['model']})

    assert @user['model'].id.present?
  end

  test 'should display error if no current user is present' do
    @user = User::Show.({})

    puts @user['options']
  end
end