# frozen_string_literal: true

module Mapi
  class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authorize_request
    attr_reader :current_mentor

    private

    def authorize_request
      @current_mentor = Mapi::AuthorizeMapiRequest.new(request.headers).call[:mentor]
    end
  end
end
