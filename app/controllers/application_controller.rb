class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_user

  protected

  # Authentication check when current user is required
  def current_user_required
    authenticate!

    unless @current_user.present?
      render json: {
        errors: 'Access denied'
      }, status: :unauthorized
    end
  end

  private

  # Authenticate token from the header by
  #   finding the appropriate user
  def authenticate!
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(token: token)
    end
  end
end
