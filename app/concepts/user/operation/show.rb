class User::Show < Trailblazer::Operation
  step :find_user!
  failure :log_errors!

  success :log_response!

  def log_errors!(options)
    options['response.status'] = 422
    options['presenter.default'] = {errors: "Something is wrong" }
  end

  def log_response!(options)
    options['response.status'] = 200
    options['presenter.default'] = UserDecorator.new(options['model']).as_json
  end

  def find_user!(options)
    options['model'] = options[:current_user]
  end
end
