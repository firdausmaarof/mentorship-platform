# frozen_string_literal: true

module Mapi
  class AuthenticateMentor
    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      JsonWebToken.encode(mentor_id: mentor.id) if mentor
    end

    private

    attr_reader :email, :password

    def mentor
      mentor = Mentor.find_by(email: email)
      return mentor if mentor&.authenticate(password)

      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
end
