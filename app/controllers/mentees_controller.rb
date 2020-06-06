# frozen_string_literal: true

class MenteesController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    mentee = Mentee.create!(mentee_params)
    auth_token = AuthenticateUser.new(mentee.email, mentee.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
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
