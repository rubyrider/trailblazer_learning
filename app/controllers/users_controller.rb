class UsersController < ApplicationController

  before_action :current_user_required, only: [:show, :update]

  # Returns a current_user data in json format
  #
  # GET /user
  #
  # = Examples
  #
  #   resp = get("/user", header: {"HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4"})
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => { id: 1, email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }
  #
  #   resp = conn.get("/user")
  #
  #   resp.status
  #   => 401
  #
  #   resp.body
  #   => { "errors": 'Access denied' }
  #
  def show
    @result = User::Show.({}, current_user: current_user)

    render json: @result['presenter.default'], status: @result['response.status']
  end

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

  # Update current user
  #
  # PUT /user
  #
  # params:
  #   email - A valid and unique email address. Required field.
  #   full_name - A full name of the user.
  #
  # = Examples
  #
  #   resp = put("/user", params: { email: 'rubyridergo@gmail.com' },
  #   header: { "HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4" })
  #
  #   resp.status
  #   => 200
  #
  #   resp.body
  #   => { id: 1, email: 'rubyridergo@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }
  #
  #   resp = conn.post("/user", email: 'rubyridergo@gmail.com' ),
  #   header: { "HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4" })
  #
  #   resp.status
  #   => 204
  #
  #   resp.body
  #   => { "errors": { "email": [ "has already been taken" ] } }
  #
  def update
    @result = User::Update.(user_params.merge(id: current_user.id))

    render json: @result['presenter.default'], status: @result['response.status']
  end

  private
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:full_name, :email)
  end
end
