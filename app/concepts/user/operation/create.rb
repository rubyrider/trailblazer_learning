class User::Create < Trailblazer::Operation
  step Model(User, :new)
  step :ensure_token_generated!
  step Contract::Build(constant: User::Contract::UserForm)
  step Contract::Validate()
  step Contract::Persist()

  success :generate_json
  failure :log_errors!

  def log_errors!(options)
    options['response.status'] = 422
    options['presenter.default'] = {errors: options['contract.default'].errors.messages }
  end

  def generate_json(options)
    options['response.status'] = 201
    options['presenter.default'] = UserDecorator.new(options['model']).as_json
  end

  # Check or generate token for user
  def ensure_token_generated!(options)
    options['model'].token ||= SecureRandom.hex
  end
end
