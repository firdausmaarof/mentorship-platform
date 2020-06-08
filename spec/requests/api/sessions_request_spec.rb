# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Sessions', type: :request do
  let(:mentee) { build(:mentee) }
  let(:mentor) { build(:mentor) }
  let!(:sessions) { create_list(:session, 10, mentee: mentee, mentor: mentor) }
  let(:session_id) { sessions.first.id }
  let(:headers) { valid_headers }

  describe 'GET /api/sessions' do
    before { get '/api/sessions', params: {}, headers: headers }

    it 'returns sessions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/sessions/:id' do
    before { get "/api/sessions/#{session_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the session' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(session_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:session_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Session/)
      end
    end
  end

  describe 'POST /api/sessions' do
    let(:valid_attributes) do
      { description: 'Description', date: Date.tomorrow, status: 'pending', mentor_id: mentor.id }
    end

    context 'when valid request' do
      before { post '/api/sessions', params: valid_attributes.to_json, headers: headers }

      it 'creates a new session' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Session created successfully/)
      end

      it 'returns the created session' do
        expect(json['session']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/api/sessions', params: {}, headers: headers }

      it 'does not create a new session' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Mentor must exist, Mentor can't be blank, Description can't be blank, Date can't be blank/)
      end
    end
  end

  describe 'PUT /api/sessions/:id' do
    let(:valid_attributes) { { status: 'cancelled' }.to_json }

    context 'when the record exists' do
      before { put "/api/sessions/#{session_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
