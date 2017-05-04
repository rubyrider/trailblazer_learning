class UsersController < ApplicationController

  # Returns a list of recent projects for a given user
  #
  # POST /users
  #
  # params:
  #   email - A valid and unique email address. Required field.
  #   full_name - A full name of the user.
  #
  # = Examples
  #
  #   resp = post("/users", "email" => "irfandhk@gmail.com")
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => { id: 1, email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }
  #
  #   resp = conn.post("/users", email: 'irfandhk@gmail.com')
  #
  #   resp.status
  #   => 422
  #
  #   resp.body
  #   => { "errors": { "email": [ "has already been taken" ] } }
  #
  def create
    @result = User::Create.(user_params)

    render json: @result['presenter.default'], status: @result['response.status']
  end

  private
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:full_name, :email)
  end
end
