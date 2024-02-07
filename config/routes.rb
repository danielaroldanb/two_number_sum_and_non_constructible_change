# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/two_numbers_sum', to: 'challenge_one#two_numbers_sum'
  post '/two_numbers_sum', to: 'challenge_one#calculate_two_numbers_sum'
  get '/non_constructible_change', to: 'challenge_two#non_constructible_change'
  post '/non_constructible_change', to: 'challenge_two#calculate_non_constructible_change'
end
