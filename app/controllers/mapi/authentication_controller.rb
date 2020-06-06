# frozen_string_literal: true

module Mapi
  class AuthenticationController < Mapi::ApplicationController
    skip_before_action :authorize_request, only: :authenticate

    def authenticate
      auth_token =
        Mapi::AuthenticateMentor.new(auth_params[:email], auth_params[:password]).call
      json_response(auth_token: auth_token)
    end

    private

    def auth_params
      params.permit(:email, :password)
    end
  end
end
