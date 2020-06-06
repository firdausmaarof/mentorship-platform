# frozen_string_literal: true

module Api
  class AuthorizeApiRequest
    def initialize(headers = {})
      @headers = headers
    end

    def call
      {
        mentee: mentee
      }
    end

    private

    attr_reader :headers

    def mentee
      @mentee ||= Mentee.find(decoded_auth_token[:mentee_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound => e
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      return headers['Authorization'].split(' ').last if headers['Authorization'].present?

      raise(ExceptionHandler::MissingToken, Message.missing_token)
    end
  end
end
