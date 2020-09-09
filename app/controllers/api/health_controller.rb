# frozen_string_literal: true

module Api
  class HealthController < Api::ApplicationController
    skip_before_action :authorize_request, only: :show
    def show
      json_response(message: 'Success')
    end
  end
end
