# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'mentees#create'
  get 'mentees', to: 'mentees#index'

  namespace :mapi do
    post 'signup', to: 'mentors#create'
    post 'auth/login', to: 'authentication#authenticate'
    get 'mentors', to: 'mentors#index'
  end
end
