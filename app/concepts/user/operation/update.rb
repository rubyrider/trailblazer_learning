class User::Update < Trailblazer::Operation
  step Model( User, :find )
  step Contract::Build(constant: User::Contract::UserForm)
  step Contract::Validate()
  step Contract::Persist()

  success :generate_json!
  failure :log_errors!

  def log_errors!(options)
    options['response.status'] = 422
    options['presenter.default'] = {errors: options['contract.default'].errors.messages }
  end

  def generate_json!(options)
    options['response.status'] = 200
    options['presenter.default'] = UserDecorator.new(options['model']).to_json
  end
end