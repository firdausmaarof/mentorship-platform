# frozen_string_literal: true

module Api
  class MentorsController < Api::ApplicationController
    skip_before_action :authorize_request, only: :create
    def index
      @mentors = Mentor.all
      json_response(@mentors)
    end

    def show
      @mentor = Mentor.find(params[:id])
      json_response(@mentor)
    end
  end
end
