Rails.application.routes.draw do
  root 'infractions#index'
  resources :infractions, only: [:index, :show]
  get 'leaderboard' => 'users#index'
  get ':username' => 'infractions#index'
end
