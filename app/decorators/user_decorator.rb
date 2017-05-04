require 'roar/decorator'
require 'roar/json'

class UserDecorator < Roar::Decorator
  include Roar::JSON

  property :full_name
  property :email
  property :token
end