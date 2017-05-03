require "reform/form/validation/unique_validator"

module User::Contract
  # Contract for user related form
  # it validates form's properties
  class UserForm < Reform::Form
    property :email
    property :full_name
    property :token

    validates :email, :full_name, :token, presence: true
    validates :email, unique: true
  end
end
