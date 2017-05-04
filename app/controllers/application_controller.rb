class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  attr_reader :current_user

  private

  def authenticate
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(token: token)
    end
  end
end
