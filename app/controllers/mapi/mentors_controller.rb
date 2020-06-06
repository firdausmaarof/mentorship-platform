# frozen_string_literal: true

module Mapi
  class MentorsController < Mapi::ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      mentor = Mentor.create!(mentor_params)
      auth_token = Mapi::AuthenticateMentor.new(mentor.email, mentor.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    end

    def index
      @mentors = Mentor.all
      json_response(@mentors)
    end

    private

    def mentor_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
