# frozen_string_literal: true

module Api
  class SessionsController < Api::ApplicationController
    before_action :set_session, only: %i[show update destroy]

    def index
      @sessions = current_mentee.sessions.order(:date)
      json_response(@sessions)
    end

    def create
      session = current_mentee.sessions.create!(session_params)
      response = { message: 'Session created successfully', session: session }
      json_response(response, :created)
    end

    def show
      json_response(@session)
    end

    def update
      @session.update(session_params)
      head :no_content
    end

    private

    def session_params
      params.permit(
        :mentor_id,
        :description,
        :date,
        :status
      )
    end

    def set_session
      @session = current_mentee.sessions.find(params[:id])
    end
  end
end
