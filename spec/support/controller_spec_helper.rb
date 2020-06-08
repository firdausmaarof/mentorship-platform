# frozen_string_literal: true

module ControllerSpecHelper
  def token_generator(mentee_id)
    JsonWebToken.encode(mentee_id: mentee_id)
  end

  def expired_token_generator(mentee_id)
    JsonWebToken.encode({ mentee_id: mentee_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      'Authorization' => token_generator(mentee.id),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end
end
