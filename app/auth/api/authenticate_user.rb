# frozen_string_literal: true

module Api
  class AuthenticateUser
    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      JsonWebToken.encode(mentee_id: mentee.id) if mentee
    end

    private

    attr_reader :email, :password

    def mentee
      mentee = Mentee.find_by(email: email)
      return mentee if mentee&.authenticate(password)

      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
end
