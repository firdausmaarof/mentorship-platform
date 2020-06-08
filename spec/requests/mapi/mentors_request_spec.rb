# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mapi::Mentors', type: :request do
  let(:mentor) { build(:mentor) }
  let(:headers) { { 'Content-Type' => 'application/json' } }
  let(:valid_attributes) do
    attributes_for(:mentor, password_confirmation: mentor.password)
  end

  describe 'POST /mapi/signup' do
    context 'when valid request' do
      before { post '/mapi/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new mentor' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/mapi/signup', params: {}, headers: headers }

      it 'does not create a new mentor' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
