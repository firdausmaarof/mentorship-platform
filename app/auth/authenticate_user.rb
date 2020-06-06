# frozen_string_literal: true

class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(mentee_id: mentee.id) if mentee
  end

  private

  attr_reader :email, :password

  # verify mentee credentials
  def mentee
    mentee = Mentee.find_by(email: email)
    return mentee if mentee&.authenticate(password)

    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
