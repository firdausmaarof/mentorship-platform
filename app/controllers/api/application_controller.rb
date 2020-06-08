# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authorize_request
    attr_reader :current_mentee

    private

    def authorize_request
      @current_mentee = Api::AuthorizeApiRequest.new(request.headers).call[:mentee]
    end
  end
end
