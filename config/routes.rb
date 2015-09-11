Rails.application.routes.draw do
  root 'infractions#index'
  resources :users, only: [:show]
  resources :infractions, only: [:index, :show]
  get 'leaderboard' => 'users#index'
  get ':username' => 'users#show'
end
