# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'mentees#create'
    get 'mentees', to: 'mentees#index'
    get 'profile', to: 'mentees#show'
    resources :mentors, only: %i[index show]
    resources :sessions, except: [:delete]
    get 'health', to: 'health#show'
  end

  namespace :mapi do
    post 'signup', to: 'mentors#create'
    post 'auth/login', to: 'authentication#authenticate'
    get 'mentors', to: 'mentors#index'
  end
end
