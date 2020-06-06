# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_mentee

  private

  # Check for valid request token and return user
  def authorize_request
    @current_mentee = AuthorizeApiRequest.new(request.headers).call[:mentee]
  end
end
