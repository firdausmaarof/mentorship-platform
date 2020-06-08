# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mapi::Authentications', type: :request do
  describe 'POST /mapi/auth/login' do
    let!(:mentor) { create(:mentor) }
    let(:headers) { { 'Content-Type' => 'application/json' } }
    let(:valid_credentials) do
      {
        email: mentor.email,
        password: mentor.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context 'When request is valid' do
      before { post '/mapi/auth/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'When request is invalid' do
      before { post '/mapi/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
