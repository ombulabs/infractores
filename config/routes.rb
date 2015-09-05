Rails.application.routes.draw do
  root 'infractions#index'
  get ':username' => 'users#show'
  resources :users, only: [:show]
  resources :infractions, only: [:index, :show]
end
