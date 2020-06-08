# frozen_string_literal: true

module Api
  class MenteesController < Api::ApplicationController
    skip_before_action :authorize_request, only: :create
    def create
      mentee = Mentee.create!(mentee_params)
      auth_token = Api::AuthenticateUser.new(mentee.email, mentee.password).call
      response = { message: Message.account_created, auth_token: auth_token, mentee: mentee }
      json_response(response, :created)
    end

    def show
      json_response(current_mentee)
    end

    private

    def mentee_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
