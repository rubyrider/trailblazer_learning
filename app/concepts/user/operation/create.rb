class User::Create < Trailblazer::Operation
  step Model(User, :new)
  step :ensure_token_generated!
  step Contract::Build(constant: User::Contract::UserForm)
  step Contract::Validate()
  step Contract::Persist()

  success :print_user_info

  # Check or generate token for user
  def ensure_token_generated!(options)
    options['model'].token ||= SecureRandom.hex
  end

  def print_user_info(options)
    puts options['model'].id
    puts options['model'].email
    puts options['model'].full_name
    puts options['model'].token
  end
end
